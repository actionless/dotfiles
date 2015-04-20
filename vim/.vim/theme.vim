
" |||| THEME ||||
set cursorline
""""""""""""""""""""""""""
"colorscheme default
"set bg=dark
"colorscheme actionless
colorscheme fixed-dark-actionless_monokai
"colorscheme term-wargrey
"colorscheme term-dark-noctu
"colorscheme actionless3
"colorscheme miromiro
"colorscheme delek
"colorscheme noctu
""colorscheme desert
""colorscheme peachpuff
"colorscheme zellner

""""""""""""""""""""""""""

" defaults:
"autocmd VimEnter,Colorscheme * :hi Normal ctermfg=none
"autocmd VimEnter,Colorscheme * :hi Search         term=reverse ctermbg=11 ctermfg=0 guibg=Yellow
"autocmd VimEnter,Colorscheme * :hi SpellBad         term=reverse ctermbg=10 ctermfg=0 guibg=Red
"autocmd VimEnter,Colorscheme * :hi Visual         term=reverse ctermbg=5 guibg=Yellow
"autocmd VimEnter,Colorscheme * :hi ColorColumn term=reverse ctermbg=0 guibg=Black

"" indent guides:
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233
