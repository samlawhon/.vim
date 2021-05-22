" =============================================================================
" Editor settings
" =============================================================================
" Make sure that `stty start undef` is in ~/.bashrc
" https://stackoverflow.com/a/21808952

" Only the best color theme
colo iceberg

" Tim Pope's `sensible.vim` takes care of many others
set nocompatible
filetype plugin on
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
set list listchars=tab:>-,trail:·

" Default file style modeled after PEP8
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
  autocmd BufWritePre
    \ " Delete trailing whitespace
    \ * %s/\s\+$//e
    \ " Automatically create folders
    \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
      \ call mkdir(expand('<afile>:h'), 'p') |
    \ endif
augroup END
