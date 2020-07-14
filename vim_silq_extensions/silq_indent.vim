" Vim indent file
" Language:     Silq
" Author:       Abeer Vaishnav <abeer.vaishnav13@gmail.com>
" Last Change:  2020 July 12
" License:      GNU General Public License v3
"

if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

" C indentation is not very useful, mainly due to Silq's := operator.

setlocal nolisp
setlocal autoindent
setlocal indentexpr=SilqIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists('*SilqIndent')
  finish
endif

function! SilqIndent(lnum)
  let l:prevlnum = prevnonblank(a:lnum-1)
  if l:prevlnum == 0
    " top of file
    return 0
  endif

  " grab the previous and current line, stripping comments.
  let l:prevl = substitute(getline(l:prevlnum), '//.*$', '', '')
  let l:thisl = substitute(getline(a:lnum), '//.*$', '', '')
  let l:previ = indent(l:prevlnum)

  let l:ind = l:previ

  if l:prevl =~ '[({]\s*$'
    " previous line opened a block
    let l:ind += shiftwidth()
  endif
  if l:prevl =~# '^\s*\(case .*\|default\):$'
    " previous line is part of a switch statement
    let l:ind += shiftwidth()
  endif
  " TODO: handle if the previous line is a label.

  if l:thisl =~ '^\s*[)}]'
    " this line closed a block
    let l:ind -= shiftwidth()
  endif

  " Colons are tricky.
  " We want to outdent if it's part of a switch ("case foo:" or "default:").
  " We ignore trying to deal with jump labels because (a) they're rare, and
  " (b) they're hard to disambiguate from a composite literal key.
  if l:thisl =~# '^\s*\(case .*\|default\):$'
    let l:ind -= shiftwidth()
  endif

  return l:ind
endfunction

" vim: sw=2 sts=2 et
