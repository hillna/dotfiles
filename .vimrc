set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

set number			" line numbers
" set paste
" set mouse=a

" Vundle Settings
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rodjek/vim-puppet'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'nvie/vim-flake8'
Plugin 'kovetskiy/sxhkd-vim'
" Plugin 'ncm2/ncm2'
" Plugin 'roxma/nvim-yarp'

" ncm2 completion sources
" https://github.com/ncm2/ncm2/wiki
" Plugin 'ncm2/ncm2-tmux'
" Plugin 'ncm2/ncm2-github'
" Plugin 'ncm2/ncm2-path'
" Plugin 'ncm2/ncm2-jedi'
" Plugin 'ncm2/ncm2-tern'

call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle Settings

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

syntax enable
let g:solarized_termtrans = 1
colorscheme solarized
filetype plugin indent on

set background=dark

set laststatus=2
let g:airline_powerline_fonts = 1

set timeoutlen=1000 ttimeoutlen=10

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

autocmd BufWritePre * %s/\s\+$//e

