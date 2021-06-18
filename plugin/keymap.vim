" =============================================================================
"                              Keyboard Shortcuts
" =============================================================================
" Search for [<letter>] to see what's mapped under <leader><letter>.
" e.g. /[s] will take you to the settings navigation section.

" Faster scrolling
nnoremap <C-e>                2<C-E>
nnoremap <C-y>                2<C-Y>

" Make spacebar the leader key
let mapleader=" "
nnoremap <Space> <Nop>

" Case-insensitive search
nnoremap <leader>/            /\c<Left><Left>

" [v]imscript execution
" -----------------------------------------------------------------------
" Execute the whole line under cursor in normal mode
nnoremap <silent><leader>ve   yy:@"<CR>0
" Execute visual selection
vnoremap <silent><leader>ve   y:@"<CR>

" Select 'in next' or 'in last' thing
" -----------------------------------------------------------------------
onoremap in(                  :<C-U>normal! f(vi(<CR>
onoremap in[                  :<C-U>normal! f[vi[<CR>
onoremap il(                  :<C-U>normal! F)vi(<CR>
onoremap il[                  :<C-U>normal! F]vi[<CR>
onoremap i;                   :<C-U>execute "normal! v/;\rhs"<CR>

" [s]ettings navigation
" -----------------------------------------------------------------------
nnoremap <silent><leader>si   :<C-u>e $MYVIMRC<CR>
nnoremap <silent><leader>sn   :<C-u>e ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>sv   :<C-u>e ~/.vim/vimrc<CR>
nnoremap <silent><leader>sk   :<C-u>e ~/.vim/plugin/keymap.vim<CR>
nnoremap <silent><leader>sp   :<C-u>e ~/.vim/plugin<CR>

" Capitalize last word while inserting text
" -----------------------------------------------------------------------
inoremap <C-j>                <Esc>viwUea

" Markdown and RST headers
" -----------------------------------------------------------------------
nnoremap <leader>1            yypVr=
nnoremap <leader>2            yypVr-
nnoremap <leader>3            yypVr+
nnoremap <leader>4            yypVr*
onoremap ih                   :<C-U>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>

" Tab movement
" -----------------------------------------------------------------------
" [h]
nnoremap <silent><leader>h    :<C-u>tabp<CR>
" [l]
nnoremap <silent><leader>l    :<C-u>tabn<CR>

" Clip[b]oard commands
" -----------------------------------------------------------------------
nnoremap <leader>bv           "+p
vnoremap <leader>bv           "+p
vnoremap <leader>bc           "+y

" [f]in[d] [t]hings
" -----------------------------------------------------------------------
nnoremap <leader>f            :find<space>
nnoremap <leader>d            :b<space>
nnoremap <leader>t            :tag<space>
