if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Use `make %` to convert to html
autocmd FileType markdown setlocal makeprg=python\ -m\ markdown
