function BlackCurrentFile()
  exe "%!black %"
endfunction

if !exists(':Black')
  command Black call BlackCurrentFile()
endif
