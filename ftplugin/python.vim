if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" abbreviations/snippets
iab pymain if __name__ == "__main__":
iab innit def __init__(self,

" Use make % to lint file
setlocal makeprg=flake8

" Linting external call
function! LintCurrentFile()
  return system(join([&makeprg, shellescape(expand('%'))]))
endfunction

command! Lint cgetexpr LintCurrentFile()

if executable("black")
  command! Black exe "%!black %" <bar> exe "silent redraw!"
endif

augroup python
if executable(&makeprg)
  autocmd! BufWritePost <buffer> Lint
endif

" Navigate between `class` and `def` using [[ and ]]
nnoremap <silent><buffer> [[ m':call search('^\s*\(class\\|def\)\>', "bW")<CR>
vnoremap <silent><buffer> [[ m':<C-U>exe "normal! gv"<Bar>call search('^\s*\(class\\|def\)\>', "bW")<CR>
nnoremap <silent><buffer> ]] m':call search('^\s*\(class\\|def\)\>', "W")<CR>
vnoremap <silent><buffer> ]] m':<C-U>exe "normal! gv"<Bar>call search('^\s*\(class\\|def\)\>', "W")<CR>
nnoremap <silent><buffer> [] m':call search('^\s*end\(class\\|def\)\>', "bW")<CR>
vnoremap <silent><buffer> [] m':<C-U>exe "normal! gv"<Bar>call search('^\s*end\(class\\|def\)\>', "bW")<CR>
nnoremap <silent><buffer> ][ m':call search('^\s*end\(class\\|def\)\>', "W")<CR>
vnoremap <silent><buffer> ][ m':<C-U>exe "normal! gv"<Bar>call search('^\s*end\(class\\|def\)\>', "W")<CR>
