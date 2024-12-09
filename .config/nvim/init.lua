vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.ignorecase = true

vim.opt.termguicolors = true
vim.cmd('highlight Normal guibg=none')

-- vim.api.nvim_set_keymap('n','#','*Nciw',{noremap = true})
-- vim.api.nvim_set_keymap('n','<space>','i<space><ESC>l',{noremap = true})

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-tree/nvim-web-devicons'
vim.call('plug#end')

-- "hello"

-- -- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- -- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

-- -- empty setup using defaults
-- require("nvim-tree").setup()

-- -- OR setup with some options
-- require("nvim-tree").setup({
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })
