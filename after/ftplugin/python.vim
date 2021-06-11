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

augroup python
if executable(&makeprg)
  autocmd! BufWritePost <buffer> Lint
endif
