
" |||| THEME ||||
set cursorline
""""""""""""""""""""""""""
"colorscheme default
"set bg=dark
"colorscheme actionless
colorscheme fixed-dark-monokai
""""""""""""""""""""""""""

"rainbow parenthesis:
hi level1c        ctermfg=130
hi level2c        ctermfg=15
hi level3c        ctermfg=7
hi level4c        ctermfg=8
hi level5c        ctermfg=5
hi level6c        ctermfg=13
hi level7c        ctermfg=4
hi level8c        ctermfg=12
hi level9c        ctermfg=14
hi level10c       ctermfg=6
hi level11c       ctermfg=2
hi level12c       ctermfg=10
hi level13c       ctermfg=11
hi level14c       ctermfg=3
hi level15c       ctermfg=9
hi level16c       ctermfg=1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233
