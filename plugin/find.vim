function! Find(pattern)
  exe "cexpr system('find ' . a:pattern)"
  exe "copen"
endfunction

function! FindPattern(pattern)
  exe "cexpr system('find . -path \"' . a:pattern. '\"')"
  exe "copen"
endfunction

function! FindAll(pattern)
  exe "cexpr system('find . -path \"**/' . a:pattern. '*\"')"
  exe "copen"
endfunction

if !exists(':Find')
  command -nargs=* Find :call Find(<q-args>)
endif

if !exists(':FindPattern')
  command -nargs=1 FindPattern :call FindPattern(<f-args>)
endif

if !exists(':FindAll')
  command -nargs=1 FindAll :call FindAll(<f-args>)
endif
