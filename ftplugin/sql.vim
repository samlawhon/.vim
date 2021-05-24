if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=120

if executable("sql-formatter")
  " Format on save
  command! SqlFormat exec '%!sql-formatter %' <bar> exec 'edit!'
  autocmd! BufWritePost *.sql SqlFormat
else
  exec 'echom "WARNING: sql-formatter not found"'
endif
