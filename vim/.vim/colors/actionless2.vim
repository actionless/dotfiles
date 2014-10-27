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

highlight ExtraWhitespace					ctermbg=red
highlight Conceal			ctermfg=237		ctermbg=NONE
highlight SpecialKey			ctermfg=black		ctermbg=234

highlight Type		cterm=NONE	ctermfg=DarkGreen
highlight LineNr	cterm=NONE	ctermfg=DarkGrey	ctermbg=NONE
highlight CursorLineNr	cterm=bold	ctermfg=red
"highlight CursorLine	cterm=underline	ctermbg=black		ctermfg=NONE
highlight CursorLine	cterm=NONE	ctermbg=black		ctermfg=NONE
highlight ColorColumn			ctermbg=black
highlight Pmenu ctermbg=237 gui=bold
hi PmenuSel				ctermfg=0 ctermbg=DarkBlue
hi Comment        term=bold		ctermfg=cyan
hi Constant       term=underline	ctermfg=blue
hi Special        term=bold		ctermfg=3
hi Identifier     cterm=bold ctermfg=green
hi Statement      term=bold		ctermfg=yellow
hi PreProc        term=underline	ctermfg=DarkCyan
hi Type           term=underline	ctermfg=DarkGreen


" vim: sw=2
