" Vim color file

"set background=light
let g:colors_name="term-actionless3"

" Code
hi Folded       ctermfg=8    ctermbg=none
hi FoldColumn                ctermbg=none
hi NonText      ctermfg=8
hi SpecialKey   ctermfg=0
hi Statement    ctermfg=3
hi Normal       ctermfg=NONE

" Spell
hi SpellBad     ctermfg=9    ctermbg=none

" Highlight
hi Search       ctermfg=15   ctermbg=8
hi Visual       ctermfg=6    ctermbg=none cterm=reverse
hi MatchParen   ctermfg=12   ctermbg=none cterm=reverse

" Lines
hi CursorLine                             cterm=none
hi CursorLineNr ctermfg=7
hi LineNr       ctermfg=8

" Splits
hi SignColumn                ctermbg=none
hi VertSplit    ctermfg=8                 cterm=none

" Status line / related
hi StatusLine   ctermfg=8    ctermbg=0    cterm=bold
hi StatusLineNC ctermfg=0
hi WildMenu     ctermfg=14   ctermbg=0

" Tabs
hi TabLine      ctermfg=none ctermbg=none cterm=none
hi TabLineFill  ctermfg=none ctermbg=none cterm=none
hi TabLineSel   ctermfg=15   ctermbg=0    cterm=none

" Vimdiff
hi DiffAdd      ctermfg=14   ctermbg=none
hi DiffChange   ctermfg=12   ctermbg=none
hi DiffDelete   ctermfg=10   ctermbg=none
hi DiffText     ctermfg=9    ctermbg=none


hi Conditional ctermfg=cyan
hi Repeat ctermfg=cyan
hi Operator ctermfg=cyan
hi Comment ctermfg=8


highlight ExtraWhitespace					ctermbg=3
highlight Conceal			ctermfg=237		ctermbg=NONE
highlight SpecialKey			ctermfg=black		ctermbg=234

hi Statement      term=bold ctermfg=3

highlight LineNr	cterm=NONE	ctermfg=DarkGrey	ctermbg=NONE
highlight CursorLineNr	cterm=bold	ctermfg=1
highlight CursorLine	ctermbg=NONE	ctermfg=NONE cterm=underline
highlight ColorColumn			ctermbg=black
highlight Pmenu ctermbg=237 gui=bold
hi PmenuSel				ctermfg=0 ctermbg=DarkBlue
hi TabLineFill    ctermbg=NONE cterm=NONE
"hi TabLine        cterm=NONE ctermfg=fg ctermbg=NONE
hi TabLineSel     cterm=bold ctermfg=15 ctermbg=DarkBlue

hi Search         term=reverse ctermbg=11 ctermfg=0 guibg=Yellow
hi SpellBad         term=reverse ctermbg=10 ctermfg=0 guibg=Red
hi Visual         term=reverse ctermbg=5 guibg=Yellow
