function FlakeLintCurrentFile()
  exe "cexpr system('flake8 ' . shellescape(expand('%')))"
  exe "copen"
endfunction

if !exists(':FlakeLint')
  command FlakeLint call FlakeLintCurrentFile()
endif
