-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.api.nvim_set_option_value('foldenable', true, {})
vim.api.nvim_set_option_value('foldmethod', 'expr', {})
vim.api.nvim_set_option_value('foldexpr', 'v:lua.vim.treesitter.foldexpr()', {})
vim.api.nvim_set_option_value('foldlevelstart', 99, {})

local M = {}

function M.get_github_link()
  local filepath = vim.fn.expand '%'
  local repo_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if not repo_root or repo_root == '' then
    print 'Not inside a git repository'
    return
  end

  local relpath = vim.fn.fnamemodify(filepath, ':~:.')
  local line1 = vim.fn.line 'v'
  local line2 = vim.fn.line '.'
  local start_line = math.min(line1, line2)
  local end_line = math.max(line1, line2)

  local branch = vim.fn.systemlist('git rev-parse --abbrev-ref HEAD')[1]
  if branch == 'HEAD' then
    branch = vim.fn.systemlist('git rev-parse HEAD')[1] -- use commit hash
  end

  local remote_url = vim.fn.systemlist('git remote get-url origin')[1]
  local github_url = remote_url:gsub('git@github.com:', 'https://github.com/'):gsub('%.git$', ''):gsub('^git://', 'https://')

  local url = string.format('%s/blob/%s/%s#L%d%s', github_url, branch, relpath, start_line, (start_line ~= end_line) and ('-L' .. end_line) or '')

  vim.fn.setreg('+', url)
  print('📋 Copied GitHub link to clipboard: ' .. url)
end

vim.keymap.set('n', '<leader>yg', function()
  M.get_github_link()
end, { desc = 'Copy GitHub permalink to clipboard' })

vim.keymap.set('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand '%')
  print '📋 Copied file path to clipboard: '
end, { desc = 'Copy file path to cliboard', noremap = true, silent = true })

return {}
