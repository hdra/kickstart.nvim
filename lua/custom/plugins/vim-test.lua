return {
  'vim-test/vim-test',
  init = function()
    -- vim.g['test#strategy'] = 'neovim_sticky'
    -- vim.g['test#neovim#term_position'] = 'vert'
    vim.g['test#strategy'] = 'floaterm'

    -- press ctrl-o to go back to terminal mode so can scroll through the test result
    vim.keymap.set('t', '<C-o>', '<C-\\><C-n>', { noremap = true })
    vim.keymap.set('n', '<leader>tn', function()
      vim.cmd 'TestNearest'
    end, { desc = '[T]est [n]earest' })
    vim.keymap.set('n', '<leader>tf', function()
      vim.cmd 'TestFile'
    end, { desc = '[T]est [F]ile' })
  end,
}
