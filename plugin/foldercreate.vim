" Automatically create folders when writing a new file
autocmd BufWritePre *
  \ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
    \ call mkdir(expand('<afile>:h'), 'p') |
  \ endif
