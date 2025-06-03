-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.api.nvim_set_option_value('foldenable', false, {})
vim.api.nvim_set_option_value('foldmethod', 'expr', {})
vim.api.nvim_set_option_value('foldexpr', 'nvim_treesitter#foldexpr()', {})

return {}
