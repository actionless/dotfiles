" |||| THEME ||||

"set title
"auto BufEnter * let &titlestring = hostname() .. "/" .. expand("%:p")
"set title titlestring=FUBAR%<%F%=%l/%L-%P titlelen=70
"set title titlestring=🐸%<%f
"set title titlestring=😻%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set title titlestring=🐸%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)\ -\ vim

set cursorline
"set t_Co=256
set t_Co=16

"set bg=dark


" defaults:
"autocmd VimEnter,Colorscheme * :hi Normal ctermfg=none
"autocmd VimEnter,Colorscheme * :hi Search         term=reverse ctermbg=11 ctermfg=0 guibg=Yellow
"autocmd VimEnter,Colorscheme * :hi SpellBad         term=reverse ctermbg=10 ctermfg=0 guibg=Red
"autocmd VimEnter,Colorscheme * :hi Visual         term=reverse ctermbg=5 guibg=Yellow
"autocmd VimEnter,Colorscheme * :hi ColorColumn term=reverse ctermbg=0 guibg=Black
"autocmd VimEnter,Colorscheme * :hi ColorColumn term=reverse ctermbg=0 guibg=Black
"autocmd VimEnter,Colorscheme * :hi Todo term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
autocmd VimEnter,Colorscheme * :hi Todo cterm=reverse ctermfg=11 ctermbg=0 guifg=Yellow guibg=Blue gui=standout

"" indent guides:
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232 guibg=#1e1e1e
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233 guibg=#2e2e2e
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233 guibg=#1e1031
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234 guibg=#2e2041

" ALE:
autocmd VimEnter,Colorscheme * :hi ALEWarning ctermbg=8
autocmd VimEnter,Colorscheme * :hi ALEError ctermbg=9 ctermfg=0
autocmd VimEnter,Colorscheme * :hi link ALEVirtualTextError WarningMsg
autocmd VimEnter,Colorscheme * :hi link ALEVirtualTextWarning SpellBad
"autocmd VimEnter,Colorscheme * :hi link ALEVirtualTextError SpellBad
"autocmd VimEnter,Colorscheme * :hi link ALEVirtualTextWarning WarningMsg

" TagBar:
autocmd VimEnter,Colorscheme * :hi link TagbarHighlight IncSearch


"colorscheme default
"colorscheme actionless
"colorscheme fixed-dark-actionless_monokai
"colorscheme term-wargrey
"colorscheme term-dark-noctu
"colorscheme term-actionless3
if has("gui_running")
	colorscheme fixed-dark-monokai-0e0021
	let g:airline_theme='molokai'
	set guifont=Monospace:h10
else
	"set bg=light
	if &diff
		colorscheme blue
	else
		colorscheme term-dark-actionless2
		"colorscheme term-actionless3
		"colorscheme term-wargrey
	endif
	let g:airline_theme='term'
endif
"colorscheme miromiro
"colorscheme delek
"colorscheme noctu
""colorscheme desert
"colorscheme zellner

""""""""""""""""""""""""""

" Rainbow Parentheses:
let g:rbpt_colorpairs = [
	\ [8,   'RoyalBlue3'],
	\ [7,    'SeaGreen3'],
	\ [15,     'DarkOrchid3'],
	\ [130,       'RoyalBlue3'],
	\ [1,       'RoyalBlue3'],
	\ [9,    'SeaGreen3'],
	\ [3,    'DarkOrchid3'],
	\ [11,   'firebrick3'],
	\ [10,    'RoyalBlue3'],
	\ [2,     'SeaGreen3'],
	\ [6, 'DarkOrchid3'],
	\ [14,       'firebrick3'],
	\ [12,        'RoyalBlue3'],
	\ [4,       'SeaGreen3'],
	\ [13, 'DarkOrchid3'],
	\ [5,    'firebrick3'],
	\ ]
	"\ [8,   'RoyalBlue3'],
	"\ [7,    'SeaGreen3'],
	"\ [15,     'DarkOrchid3'],
	"

" Airline:
let g:airline_theme='term'
let g:airline_powerline_fonts = 1
"let g:airline_right_sep = ''
"let g:airline_left_sep = ''
"let g:airline_left_sep = '퟽'
"let g:airline_right_sep = '퟼'
let g:airline_left_sep = $TERM_DECORATION_RIGHT
let g:airline_right_sep = $TERM_DECORATION_LEFT
" Enable the list of buffers:
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
