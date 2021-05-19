" Faster scrolling
nnoremap <C-e>                2<C-E>
nnoremap <C-y>                2<C-Y>

" Don't remember where this came from
set backspace=indent,eol,start

" Make spacebar the leader key
let mapleader=" "
nnoremap <Space> <Nop>

" Fast escape
imap jk                       <Esc>
omap jk                       <Esc>
imap kj                       <Esc>
omap kj                       <Esc>

" Rolling window quit
nnoremap <C-w><C-q>  <C-w><C-q>

" Execute the whole line under cursor in normal mode
nnoremap <silent><Leader>ve           yy:@"<CR>0

" Execute visual selection
vnoremap <silent><Leader>ve           y:@"<CR>

" Execute the whole line under cursor in normal mode
nnoremap <silent><Leader>ve           yy:@"<CR>0

" Execute visual selection
vnoremap <silent><Leader>ve           y:@"<CR>

" Select 'in next' or 'in last' thing
onoremap in(                  :<C-U>normal! f(vi(<CR>
onoremap in[                  :<C-U>normal! f[vi[<CR>
onoremap il(                  :<C-U>normal! F)vi(<CR>
onoremap il[                  :<C-U>normal! F]vi[<CR>
onoremap i;                   :<C-U>execute "normal! v/;\rhs"<CR>

" Navigation
nnoremap <silent><Leader>si   :<C-u>e $MYVIMRC<CR>
nnoremap <silent><Leader>sk   :<C-u>e ~/.vim/plugin/keymap.vim<CR>
