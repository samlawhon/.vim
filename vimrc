" =============================================================================
"                               Editor settings
" =============================================================================
" Make sure that `stty start undef` is in ~/.bashrc
" https://stackoverflow.com/a/21808952

" Only the best color theme
colo iceberg

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
set list listchars=tab:>-,trail:·
set mouse=a

" Recursive search from $PWD and current file dir with `:find`
set path+=**,.,./**

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
  autocmd BufWritePre
    \ " Delete trailing whitespace
    \ * %s/\s\+$//e
    \ " Automatically create folders
    \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
      \ call mkdir(expand('<afile>:h'), 'p') |
    \ endif
augroup END

" Command line typos
cabbrev fidn find
cabbrev greo grep
cabbrev vsf vert sfind
" `cd current file`
cabbrev ccf cd %:p:h


" =============================================================================
"                              Keyboard Shortcuts
" =============================================================================
" Search for [<letter>] to see what's mapped under <Leader><letter>.
" e.g. /[s] will take you to the settings navigation section.


" Faster scrolling
nnoremap <C-e>                2<C-E>
nnoremap <C-y>                2<C-Y>

" Make spacebar the leader key
let mapleader=" "
nnoremap <Space> <Nop>

" Fast escape
imap jk                       <Esc>
omap jk                       <Esc>
imap kj                       <Esc>
omap kj                       <Esc>

" [v]imscript execution
" -----------------------------------------------------------------------
" Execute the whole line under cursor in normal mode
nnoremap <silent><Leader>ve           yy:@"<CR>0
" Execute visual selection
vnoremap <silent><Leader>ve           y:@"<CR>

" Select 'in next' or 'in last' thing
" -----------------------------------------------------------------------
onoremap in(                  :<C-U>normal! f(vi(<CR>
onoremap in[                  :<C-U>normal! f[vi[<CR>
onoremap il(                  :<C-U>normal! F)vi(<CR>
onoremap il[                  :<C-U>normal! F]vi[<CR>
onoremap i;                   :<C-U>execute "normal! v/;\rhs"<CR>

" [s]ettings navigation
" -----------------------------------------------------------------------
nnoremap <silent><Leader>si   :<C-u>e $MYVIMRC<CR>
nnoremap <silent><Leader>sk   :<C-u>e ~/.vim/plugin/keymap.vim<CR>
nnoremap <silent><Leader>sp   :<C-u>e ~/.vim/plugin<CR>

" Capitalize last word while inserting text
" -----------------------------------------------------------------------
inoremap <C-j>                <Esc>viwUea

" Markdown and RST headers
" -----------------------------------------------------------------------
nnoremap <Leader>1            yypVr=
nnoremap <Leader>2            yypVr-
nnoremap <Leader>3            yypVr+
nnoremap <Leader>4            yypVr*
onoremap ih                   :<C-U>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>

" Tab movement
" -----------------------------------------------------------------------
" [h]
nnoremap <silent><Leader>h            :<C-u>tabp<CR>
" [l]
nnoremap <silent><Leader>l            :<C-u>tabn<CR>

" Clip[b]oard commands
" -----------------------------------------------------------------------
nnoremap <Leader>bv                   "+p
vnoremap <Leader>bv                   "+p
vnoremap <Leader>bc                   "+y
