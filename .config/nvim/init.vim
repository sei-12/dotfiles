set clipboard=unnamedplus
set relativenumber

noremap # *Nciw
noremap <space> i<space><ESC>l


call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

