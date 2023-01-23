set encoding=utf-8
set mouse=
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

filetype plugin on

map <C-b> <Left>
map <C-f> <Right>
map <C-p> <Up>
map <C-n> <Down>
map U <C-r>

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sophacles/vim-processing'
Plug 'lervag/vimtex'
call plug#end()

colorscheme rimirin

let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
