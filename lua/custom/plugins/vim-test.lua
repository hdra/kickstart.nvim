return {
  'vim-test/vim-test',
  init = function()
    vim.g['test#strategy'] = 'wezterm'
    vim.keymap.set('n', '<leader>tn', function()
      vim.cmd 'TestNearest'
    end, { desc = '[T]est [n]earest' })
  end,
}
