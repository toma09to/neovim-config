set encoding=utf-8
set number
set relativenumber
set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set termguicolors
syntax enable

map <C-b> <Left>
map <C-f> <Right>
map <C-p> <Up>
map <C-n> <Down>
map U <C-r>

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sophacles/vim-processing'
call plug#end()

filetype plugin indent on
