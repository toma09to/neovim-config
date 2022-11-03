set encoding=utf-8
set number
set relativenumber
set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
syntax enable

map <C-b> <Left>
map <C-f> <Right>
map <C-p> <Up>
map <C-n> <Down>

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin indent on

let g:rustfmt_autosave = 1
