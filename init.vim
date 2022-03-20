set encoding=utf-8
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
syntax enable
colorscheme iceberg

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

call plug#end()
