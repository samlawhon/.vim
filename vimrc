" =============================================================================
" Editor settings
" =============================================================================
" Only the best color theme
colo iceberg

" Tim Pope's `sensible.vim` takes care of many others
set nocompatible
filetype plugin on
set encoding=utf-8
set t_co=256
set t_ut=
set t_vb=
set background=dark
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

" Automatically open the quickfix menu if there are results sent to it
autocmd QuickFixCmdPost [^l]* cwindow

" Default file style - four spaces for tabs, softtabstop, etc.
augroup default
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e  " Delete trailing whitespace on save
  autocmd FileType *
    \ setlocal tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ list listchars=tab:>-,trail:·
augroup END

" For some reason, ftplugin/vim.vim isn't working. Look into that
augroup vim
  autocmd!
  autocmd FileType vim
      \ setlocal tabstop=2
      \ softtabstop=2
      \ shiftwidth=2
      \ expandtab
      \ autoindent
      \ fileformat=unix
      \ textwidth=120
augroup END

" Automatically create folders when writing a new file
autocmd BufWritePre *
  \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
    \ call mkdir(expand('<afile>:h'), 'p') |
  \ endif
