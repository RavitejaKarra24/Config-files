set guicursor=
set number
set relativenumber
set scrolloff=15
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set mouse=a
colorscheme koehler
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

let mapleader=" "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR> 
nnoremap <C-j> :cnext<CR> 
nnoremap <C-k> :cprev<CR> 
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap jk <Esc>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap <C-d> <Esc>ddi
inoremap <C-u> <Esc>viwUea
inoremap <C-s> <Esc>:w<CR>

set rtp+=/opt/homebrew/opt/fzf
