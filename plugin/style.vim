" Default
" -------
augroup default
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e  " Delete trailing whitespace on save
  autocmd FileType * setlocal tabstop=4
    \ softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent
    \ list listchars=tab:>-,trail:·
augroup END

" Json
" ----
autocmd FileType json syntax match Comment +\/\/.\+$+

" Scala/SQL
" ---------
augroup wide_twospace
  autocmd!
  autocmd FileType scala,sql setlocal
    \ tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120
augroup END

" R
" -
augroup r_lang
  autocmd!
  autocmd FileType r,vim setlocal
    \ tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79
    \ autoindent fileformat=unix
augroup END

" Vim / YAML
" ----------
augroup vim_lang
  autocmd!
  autocmd FileType vim setlocal
    \ tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    \ autoindent fileformat=unix
augroup END

augroup yaml
  autocmd!
  autocmd BufRead BufNewFile *.yml setlocal filtype=yaml
  autocmd FileType yaml setlocal
    \ tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    \ autoindent fileformat=unix
augroup END

" MakeFile
" --------
augroup make
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup END

