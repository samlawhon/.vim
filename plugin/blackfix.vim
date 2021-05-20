function BlackCurrentFile()
  exe "cexpr system('black ' . shellescape(expand('%')))"
  exe "copen"
endfunction

if !exists(':Black')
  command Black call BlackCurrentFile()
endif
