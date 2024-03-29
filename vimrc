" Authors: mostly Robert A. Enzmann, Sam Lawhon
" License: Do anything you like.
"
"   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"   !       This vim configuration is portable        !
"   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"
" Thanks to: https://stackoverflow.com/a/3384476/13215205
"
" $ git clone git@github.com:samlawhon/.vim.git ~/samvim
" $ vim -u ~/samvim/vimrc
"
" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" Use this script as the $MYVIMRC variable
let $MYVIMRC = printf('%s/vimrc', s:portable)

" =============================================================================
"                               Editor settings
" =============================================================================
" Make sure that `stty start undef` and `stty -ixon` are in ~/.bashrc
" https://stackoverflow.com/a/21808952

" Tim Pope's `sensible.vim` takes care of many others
set nocompatible
filetype plugin on
set background=dark
set encoding=utf-8
set noerrorbells
set visualbell
set cursorline
set hidden
syntax on
set linebreak
set shiftround
set number
set relativenumber
set nowrap
set hlsearch
set wildignore=*.o,*.obj,*.db-whl,*.db-shm,*node_modules*
set wildignore+=tags,.*.un~,*.pyc
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set showcmd

" Recursive search from $PWD and current file dir with `:find`
set path=.,,./**,**,

" Default file style modeled after PEP8 and `black` defaults
set softtabstop=4
set shiftwidth=4
set textwidth=85
set expandtab
set autoindent

" Imported from Daniel's Vim stuff
let mapleader = "s"
nmap - <leader>
nnoremap ; :
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <silent> <leader>; :Lines<CR>
nnoremap <silent> <leader>e :Files <CR>
nnoremap <silent> <leader>a :set list! <CR>
nnoremap <silent> <leader>t :Files ~<CR>
nnoremap <silent> <leader>g :GFiles <CR>
nnoremap <silent> <leader>gd :GoDoc <CR>
nnoremap <silent> <leader>o :Buffers <CR>
nnoremap <silent> <leader>r :Rg <CR>
nnoremap <silent> <leader>w :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>W :Rg <C-R><C-A><CR>
nnoremap <silent> <c-t> :tabnew<CR>
inoremap jk <Esc>
inoremap jj <C-]>

augroup default
  autocmd!
  " Automatically open the quickfix menu if there are results sent to it
  autocmd QuickFixCmdPost [^l]* cwindow
  " Common save hooks
  autocmd BufWritePre *
    \ " Automatically create folders
    \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
      \ call mkdir(expand('<afile>:h'), 'p') |
    \ endif
augroup END

" =============================================================================
"                              Plugin Management
" =============================================================================
" Automatically install plugins that are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Initialize plugins
call plug#begin(s:portable . '/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'psf/black'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
call plug#end()

" Only the best color theme(s)
try
    colorscheme gruvbox
    " Iceberg is also great but misses some syntax highlighting in python like `if`, `or`, etc. and doesn't work with
    " language server highlighting features.
    " colorscheme iceberg
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme industry
endtry

