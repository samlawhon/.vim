" =============================================================================
" Editor settings
" =============================================================================
" Most configuration is done as individual plugins under ~/.vim/plugin

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

autocmd QuickFixCmdPost [^l]* cwindow

" Default file style - four spaces for tabs, softtabstop, etc.
augroup default
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e  " Delete trailing whitespace on save
  autocmd FileType * setlocal tabstop=4
    \ softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent
    \ list listchars=tab:>-,trail:·
augroup END
