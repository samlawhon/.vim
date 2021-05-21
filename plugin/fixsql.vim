function SQLintCurrentFile()
  exe "cexpr system('sqlfluff lint ' . shellescape(expand('%')))"
  exe "copen"
endfunction

if !exists(':SQLint')
  command SQLint call SQLintCurrentFile()
endif
