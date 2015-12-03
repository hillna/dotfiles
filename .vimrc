set nocompatible              " be iMproved, required
filetype off                  " required

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

" End Vundle Plugins

call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle Settings

execute pathogen#infect()
syntax enable
let g:solarized_termtrans = 1
colorscheme solarized
filetype plugin indent on

set background=dark

set laststatus=2
let g:airline_powerline_fonts = 1

set timeoutlen=1000 ttimeoutlen=10

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

