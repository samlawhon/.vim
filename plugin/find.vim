" See 'grep.vim' for the inspiration of this plugin
function! Find(...)
  return system(join(['find'] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Find cgetexpr Find(<f-args>)
