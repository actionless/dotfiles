
" |||| THEME ||||
set cursorline
""""""""""""""""""""""""""
"colorscheme default
"set bg=dark
"colorscheme actionless
"colorscheme actionless_monokai
"colorscheme term-wargrey
colorscheme term-dark-noctu
"colorscheme actionless3
"colorscheme miromiro
"colorscheme delek
"colorscheme noctu
""colorscheme desert
""colorscheme peachpuff
"colorscheme zellner

""""""""""""""""""""""""""

" defaults:
autocmd VimEnter,Colorscheme * :hi Normal ctermfg=none
autocmd VimEnter,Colorscheme * :hi Search         term=reverse ctermbg=11 ctermfg=0 guibg=Yellow
autocmd VimEnter,Colorscheme * :hi SpellBad         term=reverse ctermbg=10 ctermfg=0 guibg=Red
autocmd VimEnter,Colorscheme * :hi Visual         term=reverse ctermbg=5 guibg=Yellow
autocmd VimEnter,Colorscheme * :hi ColorColumn term=reverse ctermbg=0 guibg=Black

" rainbow parenthesis:
autocmd VimEnter,Colorscheme * :hi level1c        ctermfg=130
autocmd VimEnter,Colorscheme * :hi level2c        ctermfg=15
autocmd VimEnter,Colorscheme * :hi level3c        ctermfg=7
autocmd VimEnter,Colorscheme * :hi level4c        ctermfg=8
autocmd VimEnter,Colorscheme * :hi level5c        ctermfg=5
autocmd VimEnter,Colorscheme * :hi level6c        ctermfg=13
autocmd VimEnter,Colorscheme * :hi level7c        ctermfg=4
autocmd VimEnter,Colorscheme * :hi level8c        ctermfg=12
autocmd VimEnter,Colorscheme * :hi level9c        ctermfg=14
autocmd VimEnter,Colorscheme * :hi level10c       ctermfg=6
autocmd VimEnter,Colorscheme * :hi level11c       ctermfg=2
autocmd VimEnter,Colorscheme * :hi level12c       ctermfg=10
autocmd VimEnter,Colorscheme * :hi level13c       ctermfg=11
autocmd VimEnter,Colorscheme * :hi level14c       ctermfg=3
autocmd VimEnter,Colorscheme * :hi level15c       ctermfg=9
autocmd VimEnter,Colorscheme * :hi level16c       ctermfg=1

" indent guides:
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233
