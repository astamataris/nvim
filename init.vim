set number
syntax on
set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set ruler
set rulerformat=%l,%v

let mapleader = ","
"enable emmet for html and css only
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

map ` :Files<CR>
map <C-o> :NERDTreeToggle<CR>

" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" enables completion of file paths
Plug 'ncm2/ncm2-path'

Plug 'sbdchd/neoformat'

" Format on save, if desired
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" To Run Manually
nnoremap <leader>fm :Neoformat<CR>

Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline' " For tabs on top
"Be sure to install fugitive for the below config to work and provide git status information
Plug 'tpope/vim-fugitive'
call plug#end()

let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline#bufferline#shorten_path = 1
"let g:deoplete#enable_at_startup = 1

