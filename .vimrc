set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

set number                    " line numbers
" set paste
" set mouse=a

" vim-plug settings
call plug#begin()
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rodjek/vim-puppet'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'nvie/vim-flake8'
Plug 'kovetskiy/sxhkd-vim'
Plug 'saltstack/salt-vim'

" deoplete
if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'fszymanski/deoplete-emoji'
Plug 'zchee/deoplete-jedi'

call plug#end()

syntax enable
let g:solarized_termtrans = 1
colorscheme solarized
filetype plugin indent on

" deoplete settings
let g:deoplete#enable_at_startup = 1

set background=dark

set laststatus=2
let g:airline_powerline_fonts = 1

set timeoutlen=1000 ttimeoutlen=10

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

autocmd BufWritePre * %s/\s\+$//e

" functions
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

