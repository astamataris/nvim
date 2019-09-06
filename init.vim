set number
syntax on
set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set ruler
set rulerformat=%l,%v

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:deoplete#enable_at_startup = 1
