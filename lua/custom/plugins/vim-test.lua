return {
  'vim-test/vim-test',
  init = function()
    vim.g['test#strategy'] = 'neovim_sticky'
    vim.g['test#neovim#term_position'] = 'vert'
    vim.keymap.set('n', '<leader>tn', function()
      vim.cmd 'TestNearest'
    end, { desc = '[T]est [n]earest' })
  end,
}
