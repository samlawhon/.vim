if exists('g:loaded_filetrigger')
  finish
endif
let g:loaded_filetrigger = 1

augroup yaml
  autocmd!
  autocmd BufRead BufNewFile *.yml setlocal filtype=yaml
augroup END
