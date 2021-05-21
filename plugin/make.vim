" See grep.vim for the inspiration of this
function! Make(...)
  return system(join([&makeprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Make  cgetexpr Make(<f-args>)
cnoreabbrev <expr> make  (getcmdtype() ==# ':' && getcmdline() ==# 'make')  ? 'Make'  : 'make'

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost cgetexpr cwindow
augroup END
