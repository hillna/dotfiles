set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

set number                    " line numbers
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•
"set list
"set paste
"set mouse=a

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
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Konfekt/vim-alias'
Plug 'zhaocai/GoldenView.Vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ncm2
if has('nvim')
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-github'
  Plug 'ncm2/ncm2-tmux'
  Plug 'Shougo/neco-syntax'
  Plug 'ncm2/ncm2-syntax'
  Plug 'ncm2/ncm2-jedi'
  Plug 'Shougo/neco-vim'
  Plug 'ncm2/ncm2-vim'
  "Plug 'ncm2/ncm2-go'
  Plug 'pbogut/ncm2-alchemist'
  Plug 'ncm2/ncm2-match-highlight'
  "Plug 'svermeulen/ncm2-yoink'
endif

" deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'fszymanski/deoplete-emoji'
"Plug 'zchee/deoplete-jedi'

call plug#end()

" ncm2 settings
if has('nvim')
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " IMPORTANT: :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  let g:ncm2#match_highlight = 'bold'
  let g:ncm2#match_highlight = 'sans-serif'
  let g:ncm2#match_highlight = 'sans-serif-bold'
  let g:ncm2#match_highlight = 'mono-space'
endif

" deoplete settings
"let g:deoplete#enable_at_startup = 1

" vim-go settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command='goimports'

syntax enable
let g:solarized_termtrans = 1
colorscheme solarized
filetype plugin indent on

let g:tex_flavor = 'latex'

set background=dark

set laststatus=2
let g:airline_powerline_fonts = 1

set timeoutlen=1000 ttimeoutlen=10

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

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

