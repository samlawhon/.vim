function FlakeLintCurrentFile()
  exe "cexpr system('flake8 ' . shellescape(expand('%')))"
  exe "copen"
endfunction

command FlakeLint call FlakeLintCurrentFile()
