" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"


hi Conditional ctermfg=cyan
hi Repeat ctermfg=cyan
hi Operator ctermfg=cyan


highlight ExtraWhitespace					ctermbg=3
highlight Conceal			ctermfg=237		ctermbg=NONE
highlight SpecialKey			ctermfg=black		ctermbg=234

hi Statement      term=bold ctermfg=3

highlight LineNr	cterm=NONE	ctermfg=DarkGrey	ctermbg=NONE
highlight CursorLineNr	cterm=bold	ctermfg=red
"highlight CursorLine	cterm=underline	ctermbg=black		ctermfg=NONE
highlight CursorLine	ctermbg=246	ctermfg=NONE cterm=none
highlight ColorColumn			ctermbg=black
highlight Pmenu ctermbg=237 gui=bold
hi PmenuSel				ctermfg=0 ctermbg=DarkBlue
hi TabLineFill    ctermbg=NONE cterm=NONE
"hi TabLine        cterm=NONE ctermfg=fg ctermbg=NONE
hi TabLineSel     cterm=bold ctermfg=15 ctermbg=DarkBlue

hi level1c        ctermfg=130
hi level2c        ctermfg=4
hi level3c        ctermfg=242
hi level4c        ctermfg=2
hi level5c        ctermfg=1
hi level6c        ctermfg=6
hi level7c        ctermfg=5
hi level8c        ctermfg=130
hi level9c        ctermfg=248
hi level10c       ctermfg=11
hi level11c       ctermfg=13
hi level12c       ctermfg=3
hi level13c       ctermfg=12
hi level14c       ctermfg=10
hi level15c       ctermfg=9
hi level16c       ctermfg=14

" vim: sw=2
