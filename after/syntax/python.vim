" SQL Syntax highlighting in python strings
" -----------------------------------------
" https://stackoverflow.com/a/35882720
" SQL syntax file won't load if this is set
unlet b:current_syntax

" Load SQL syntax
syn include @SQL syntax/sql.vim

" We don't need these (a string inside a string!)
syn cluster SQL remove=sqlString,sqlComment

" Clear existing syntax
syntax clear pythonString

" Triple-quoted strings can contain SQL. This is the same as the original
" except with @SQL added in contains=
syn region  pythonString
    \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
    \ contains=pythonEscape,@Spell
syn region  pythonString
    \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
    \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell,@SQL
syn region  pythonRawString
    \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
    \ contains=@Spell
syn region  pythonRawString
    \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
    \ contains=pythonSpaceError,pythonDoctest,@Spell,@SQL

" Python syntax highlighting inside f-strings
" -------------------------------------------
" https://phelipetls.github.io/posts/f-strings-syntax-highlighting-in-vim/
syn match pythonEscape +{{+ contained containedin=pythonfString,pythonfDocstring
syn match pythonEscape +}}+ contained containedin=pythonfString,pythonfDocstring

syn region pythonfString matchgroup=pythonQuotes
      \ start=+[fF]\@1<=\z(['"]\)+ end="\z1"
      \ contains=@Spell,pythonEscape,pythonInterpolation,@SQL
syn region pythonfDocstring matchgroup=pythonQuotes
      \ start=+[fF]\@1<=\z('''\|"""\)+ end="\z1" keepend
      \ contains=@Spell,pythonEscape,pythonSpaceError,pythonInterpolation,pythonDoctest,@SQL
syn region pythonInterpolation contained
      \ matchgroup=SpecialChar
      \ start=+{{\@!+ end=+}}\@!+ skip=+{{+ keepend
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction,pythonDoctestValue,pythonDoctest,@SQL

syn match pythonStringModifier /:\(.[<^=>]\)\?[-+ ]\?#\?0\?[0-9]*[_,]\?\(\.[0-9]*\)\?[bcdeEfFgGnosxX%]\?/ contained containedin=pythonInterpolation
syn match pythonStringModifier /![sra]/ contained containedin=pythonInterpolation

hi link pythonfString String
hi link pythonfDocstring String
hi link pythonStringModifier PreProc

" Re-set current syntax
let b:current_syntax = 'python'

