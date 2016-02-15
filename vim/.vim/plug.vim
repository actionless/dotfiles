call plug#begin('~/.vim/plugged')

" Style:
"
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'less', 'sass', 'scss', 'vim', 'stylus']}
"Plug 'junegunn/rainbow_parentheses.vim'
	"au VimEnter * RainbowParentheses
	"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
	"[ 1, 9, 3, 11, 10, 2, 6, 14, 12, 4, 13, 5, 8, 7, 15, 130 ]
Plug 'kien/rainbow_parentheses.vim'
	au VimEnter * RainbowParenthesesToggleAll
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

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='term'
	let g:airline_powerline_fonts = 1
	"let g:airline_right_sep = ''
	"let g:airline_left_sep = ''
	let g:airline_left_sep = '퟽'
	let g:airline_right_sep = '퟼'
	" Enable the list of buffers:
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#fnamemod = ':t'
"Plug 'bling/vim-bufferline'
	"let g:bufferline_echo = 0
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
" Show marks:
Plug 'kshenoy/vim-signature'


Plug 'wimstefan/Lightning'
Plug 'romainl/Apprentice'



" Navigation:
"
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
	let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|env|node_modules|bower_components)$',
	\ 'file': '\v(\.pyc|\~)$',
	\ }
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	let NERDTreeIgnore=['\~$', '\.pyc', '^__pycache__$']
"Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar'


" CODING:
"

Plug 'google/vim-maktaba', { 'on': ['FormatCode', 'FormatLines'] }
Plug 'google/vim-codefmtlib', { 'on': ['FormatCode', 'FormatLines'] }
Plug 'google/vim-codefmt', { 'on': ['FormatCode', 'FormatLines'] }

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'
	"let g:syntastic_python_checkers=['flake8', 'python', 'pylint']
	"let g:syntastic_python_checkers=['flake8', 'pylint']
	let g:syntastic_python_checkers=['flake8']
	let g:syntastic_html_tidy_exec = '/usr/sbin/tidy'
	let g:syntastic_lua_checkers = ['luac', 'luacheck']
	let g:syntastic_c_checkers = ['gcc', 'make']
	let g:ycm_show_diagnostics_ui = 0
	let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
	"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
	"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" installed system-wide for normal vim:
if has('nvim')
	Plug 'Valloric/YouCompleteMe'
endif
" remove? :
"Plug 'Shougo/neocomplete.vim'
"source ~/.vim/neocomplete.vim

"
" Fish:
Plug 'dag/vim-fish', {'for': 'fish'}

" JS:
if !has('nvim')
	Plug 'marijnh/tern_for_vim', {'for': ['javascript', 'html']}
endif
Plug 'othree/html5.vim', {'for': 'html'}

" CSS:
Plug 'groenewege/vim-less', {'for': 'less'}

" Go:
Plug 'fatih/vim-go', {'for': 'go'}
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1
	highlight link goStruct Type
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1

" Nix:
"Plug 'tlib', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-actions', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-completion', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-goto-thing-at-cursor', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-errorformats', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-mw-utils', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-nix', {'for': 'nix'}


" themes:
" term:
Plug 'ajgrf/sprinkles'
" fixed light:
Plug 'acarapetis/vim-colors-github'
Plug 'adampasz/stonewashed-themes'
Plug 'jlesquembre/peaksea'

call plug#end()
