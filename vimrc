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
syntax on
set linebreak
set shiftround
set number
set relativenumber
set nowrap
set hlsearch
set wildignore=*.o,*.obj,*.db,*node_modules*
set wildignore+=tags,.*.un~,*.pyc
set list listchars=tab:>-,trail:·
set mouse=a
set showcmd

" Recursive search from $PWD and current file dir with `:find`
set path=.,,./**,**,

" Default file style modeled after PEP8 and `black` defaults
set softtabstop=4
set shiftwidth=4
set textwidth=85
set expandtab
set autoindent

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

" Command line typos
cabbrev fidn find
cabbrev greo grep
cabbrev vsf vert sfind
cabbrev %% %:p:h
" `cd current file`
cabbrev ccf cd %:p:h

" =============================================================================
"                              Plugin Management
" =============================================================================
" Automatically install plugins that are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Initialize plugins
call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'psf/black'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
call plug#end()

" Only the best color theme(s)
try
    colorscheme iceberg
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme industry
endtry

