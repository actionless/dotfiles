" |||| THEME ||||

set cursorline

"colorscheme default
"set bg=dark

"colorscheme actionless
"colorscheme fixed-dark-actionless_monokai
"colorscheme term-wargrey
"colorscheme term-dark-noctu
"colorscheme term-actionless3
if has("gui_running")
	colorscheme fixed-dark-monokai-0e0021
else
	"set bg=light
	"colorscheme term-dark-actionless2
	colorscheme fixed-light-github
	"colorscheme term-actionless3
	"colorscheme term-wargrey
endif
let g:airline_theme='xtermlight'
"colorscheme miromiro
"colorscheme delek
"colorscheme noctu
""colorscheme desert
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
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232 guibg=#1e1e1e
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233 guibg=#2e2e2e
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233 guibg=#1e1031
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234 guibg=#2e2041


"TagBar:
autocmd VimEnter,Colorscheme * :hi link TagbarHighlight IncSearch

	"let g:airline_right_sep = ''
	"let g:airline_left_sep = ''
	let g:airline_left_sep = '퟽'
	let g:airline_right_sep = '퟼'
