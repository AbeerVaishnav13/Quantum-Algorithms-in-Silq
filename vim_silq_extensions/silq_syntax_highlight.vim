" Vim syntax file
" Language:    Silq
" Author:		Abeer Vaishnav <abeer.vaishnav13@gmail.com>
" Last Change:	2020 July 12
" License:		GNU General Public License v3

" quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

" Constant and numbers
syn keyword silqConstant π Pi Π
syn keyword silqBoolean true false

syn match   silqNumber	"\<0[oO]\=\o\+[Ll]\=\>"
syn match   silqNumber	"\<0[xX]\x\+[Ll]\=\>"
syn match   silqNumber	"\<0[bB][01]\+[Ll]\=\>"
syn match   silqNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   silqNumber	"\<\d\+[jJ]\>"
syn match   silqNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   silqNumber	"\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   silqNumber	"\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

" Special powers of silq (quantum stuff)
syn keyword silqSpecial lifted mfree qfree const quantum classical
syn keyword silqSpecial quantum classical
syn match	silqSpecial "[!]"

" Silq Standard Functions
syn keyword silqStdFunc measure forget
syn keyword silqStdFunc H phase rotX rotY rotZ
syn keyword silqStdFunc X Y Z dup reverse
syn keyword silqStdFunc lambda λ xorb div sub
syn keyword silqStdFunc  __show __query
syn match	silqStdFunc "[+\-*/&|\^%~]"
syn match	silqStdFunc "<<"
syn match	silqStdFunc ">>"

" Silq Inbuilt Math functions
syn keyword silqInbuilt sin cos tan asin acos atan
syn keyword silqInbuilt abs min max pow sqrt round
syn keyword silqInbuilt floor ceil log exp

" Silq Structures
syn keyword silqStructure vector array

" Silq basic classical functions
syn keyword silqBasicFunc assert print

" Silq datatypes
syn keyword silqType ℕ 𝔹 ℤ ℚ ℝ ℂ Bool none
syn keyword silqType uint int float rat string

" Silq Comments
syn match   silqComment	"//.*$" contains=silqTodo
syn keyword silqTodo FIXME TODO NOTES NOTE XXX expected Expected EXPECTED contained

" Silq statement keywords
syn keyword silqStatement def dat continue as in
syn keyword silqStatement return EOF exit dump

" Silq flow control keywords
syn keyword silqFlowControl if then else import for while repeat
syn keyword silqFlowControl cobserve observe coerce

" Linking silq definitions to standard definitions.
hi def link silqType Type
hi def link silqConstant Constant
hi def link silqSpecial Special
hi def link silqStdFunc Identifier
hi def link silqStructure Structure
hi def link silqBasicFunc Structure
hi def link silqComment Comment
hi def link silqTodo Todo
hi def link silqStatement Statement
hi def link silqInbuilt String
hi def link silqBoolean Number
hi def link silqFlowControl Include
hi def link silqNumber Number
