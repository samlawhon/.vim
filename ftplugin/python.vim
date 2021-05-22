" abbreviations/snippets
iab pymain if __name__ == "__main__":
iab innit def __init__(self,

" Linting external call
function FlakeLintCurrentFile()
  exe "cexpr system('flake8 ' . shellescape(expand('%')))"
  exe "copen"
endfunction

if !exists(':FlakeLint')
  command FlakeLint call FlakeLintCurrentFile()
endif

" Use make % to lint file
setlocal makeprg=flake8

" Formatter external call
function BlackCurrentFile()
  exe "%!black %"
endfunction

if !exists(':Black')
  command Black call BlackCurrentFile()
endif

autocmd! BufWritePost *.py Black
