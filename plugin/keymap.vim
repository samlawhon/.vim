" =============================================================================
" Keyboard Shortcuts
" =============================================================================
"
" Search for [<letter>] to see what's mapped under <Leader><letter>.
" e.g. /[s] will take you to the settings navigation section.
"
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
