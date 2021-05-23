if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=120

" Linter external call
function SQLintCurrentFile()
  exe "cexpr system('sqlfluff lint ' . shellescape(expand('%')))"
  exe "copen"
endfunction

command! SQLint cgetexpr SQLintCurrentFile()
