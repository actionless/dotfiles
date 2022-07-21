" Vim color file based on the default colorscheme
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "term-dark-actionless2"

highlight ExtraWhitespace					ctermbg=red
highlight Conceal			ctermfg=237		ctermbg=NONE
"highlight SpecialKey			ctermfg=black		ctermbg=234
highlight SpecialKey term=bold ctermfg=8 gui=bold guifg=Blue

highlight Type		cterm=NONE	ctermfg=DarkGreen
highlight LineNr	cterm=NONE	ctermfg=DarkGrey	ctermbg=NONE
highlight CursorLineNr	cterm=bold	ctermfg=red
"highlight CursorLine	cterm=underline	ctermbg=black		ctermfg=NONE
highlight CursorLine	cterm=NONE	ctermbg=black		ctermfg=NONE
highlight ColorColumn			ctermbg=black

highlight Pmenu gui=bold ctermbg=13
highlight PmenuSel ctermfg=0 ctermbg=5
"highlight PmenuSel cterm=bold ctermfg=0 ctermbg=6

hi TabLineFill    ctermbg=NONE cterm=NONE
"hi TabLine        cterm=NONE ctermfg=fg ctermbg=NONE
hi TabLineSel     cterm=bold ctermfg=15 ctermbg=DarkBlue

"hi Comment       cterm=NONE		ctermfg=8
hi Comment        cterm=bold		ctermfg=6
"hi Constant       cterm=underline	ctermfg=blue
hi Constant       					ctermfg=blue
hi Special        cterm=bold		ctermfg=3
hi Identifier     cterm=bold ctermfg=green
hi Statement      cterm=bold		ctermfg=yellow
"hi PreProc        cterm=underline	ctermfg=DarkCyan
hi PreProc        ctermfg=DarkCyan
hi Type           cterm=underline	ctermfg=DarkGreen

hi Search         cterm=reverse ctermbg=11 ctermfg=0
hi SpellBad       cterm=reverse ctermbg=10 ctermfg=0
hi Visual         cterm=reverse ctermbg=4

" vim: sw=2
