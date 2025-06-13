return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ma', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>sh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
