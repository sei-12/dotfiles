vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.ignorecase = true

vim.cmd('syntax enable')

vim.opt.langmenu = "en_US"
vim.cmd("language en_US")


local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'tpope/vim-surround'
Plug 'folke/tokyonight.nvim'
Plug 'tpope/vim-commentary'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/vim-scripts/ScrollColors'
vim.call('plug#end')

require("tokyonight").setup({
    style = "night",          -- Tokyonightのスタイル ("night", "storm", "day", など)
    transparent = true,       -- 背景色を透明にする
    terminal_colors = true,   -- ターミナルのカラースキームを尊重
})
vim.cmd[[colorscheme tokyonight-storm]]

-- vim.opt.termguicolors = false

-- 
-- vim.opt.background = dark

