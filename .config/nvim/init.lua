vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true

vim.api.nvim_set_keymap('n','#','*Nciw',{noremap = true})
vim.api.nvim_set_keymap('n','<space>','i<space><ESC>l',{noremap = true})

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
vim.call('plug#end')
