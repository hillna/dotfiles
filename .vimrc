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
" Plug 'jpalardy/vim-slime'
Plug 'APZelos/blamer.nvim'
Plug 'Konfekt/vim-alias'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'b4b4r07/vim-hcl'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kovetskiy/sxhkd-vim'
Plug 'lervag/vimtex'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdtree'
Plug 'rodjek/vim-puppet'
Plug 'saltstack/salt-vim'
Plug 'saltstack/salt-vim'
Plug 'stevearc/vim-arduino'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'vim-airline/vim-airline-themes'
Plug 'zhaocai/GoldenView.Vim'

" ncm2
if has('nvim')
  "Plug 'ncm2/ncm2-go'
  "Plug 'svermeulen/ncm2-yoink'
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neco-vim'
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-github'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-match-highlight'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-syntax'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-vim'
  Plug 'pbogut/ncm2-alchemist'
  Plug 'roxma/nvim-yarp'
endif

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

" Git Blamer settings
let g:blamer_enabled = 1
let g:blamer_delay = 1000
let g:blamer_show_in_visual_modes = 0
let g:blamer_date_format = '%Y-%m-%dT%H:%M:%S%z'
let g:blamer_template = '<committer>, <committer-time> • <summary> • <commit-short>'

" vim-go settings
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command='goimports'

" vim-terraform settings
let g:terraform_align=1
" let g:terraform_fold_sections=1
" let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
autocmd FileType terraform setlocal commentstring=#%s

" vim-arduino settings


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

