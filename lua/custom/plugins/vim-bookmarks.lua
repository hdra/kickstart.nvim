return {
  'MattesGroeger/vim-bookmarks',
  init = function()
    vim.g.bookmark_no_default_key_mappings = 1
    vim.g.bookmark_auto_save = 1
    vim.g.bookmark_save_per_working_dir = 1
    vim.g.bookmark_manage_per_buffer = 1
    vim.g.bookmark_auto_close = 1
    vim.g.bookmark_show_toggle_warning = 0
    vim.g.bookmark_display_annotation = 1

    vim.keymap.set('n', 'ma', function()
      vim.cmd 'BookmarkShowAll'
      vim.cmd 'cclose'
      vim.cmd 'FzfLua quickfix'
    end, { desc = 'Show all bookmarks' })

    vim.keymap.set('n', 'mm', function()
      vim.cmd 'BookmarkToggle'
    end, { desc = 'Toggle bookmark on current line' })

    vim.keymap.set('n', 'mi', function()
      vim.cmd 'BookmarkAnnotate'
    end, { desc = 'Annotate current bookmark' })

    vim.keymap.set('n', 'mc', function()
      vim.cmd 'BookmarkClear'
    end, { desc = 'Clear bookmarks in current buffer' })

    vim.keymap.set('n', 'mC', function()
      vim.cmd 'BookmarkClearAll'
    end, { desc = 'Clear all bookmarks' })
  end,
}
