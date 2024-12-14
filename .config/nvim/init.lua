vim.opt.clipboard      = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.scrolloff      = 10

-- indent
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.smartindent    = true
vim.opt.autoindent = true

vim.opt.ignorecase     = true

vim.cmd('syntax enable')

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'tpope/vim-surround'
Plug 'folke/tokyonight.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'cohama/lexima.vim'
vim.call('plug#end')


require('lualine').setup()
require('gitsigns').setup()

require("tokyonight").setup({
    style           = "night",          -- Tokyonightのスタイル ("night", "storm", "day", など)
    transparent     = true,       -- 背景色を透明にする
    terminal_colors = true,   -- ターミナルのカラースキームを尊重
})
vim.cmd[[colorscheme tokyonight-storm]]


vim.cmd[[
	nmap <C-S-o> :Files<CR>
]]

vim.cmd[[
	"noremap <C-f> <Plug>(easymotion-bd-w)
	"noremap gl <Plug>(easymotion-bd-jk)
	"noremap <S-f> <Plug>(easymotion-bd-f)

    "omap ab <Plug>(textobj-multiblock-a)
    "omap ib <Plug>(textobj-multiblock-i)
    "vmap ab <Plug>(textobj-multiblock-a)
    "vmap ib <Plug>(textobj-multiblock-i)
]]

-- Plug 'junegunn/vim-easy-align'
vim.cmd[[
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
]]

vim.cmd[[
    nnoremap * *N
]]
