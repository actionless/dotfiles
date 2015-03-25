call plug#begin('~/.vim/plugged')

" Style:
"
Plug 'gorodinskiy/vim-coloresque', {'for': 'css'}
Plug 'kien/rainbow_parentheses.vim'
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
Plug 'bling/vim-airline'
	let g:airline_theme='wombat'
	"let g:airline_theme='kolor'
	let g:airline_powerline_fonts = 1
	let g:airline_right_sep = ''
	let g:airline_left_sep = ''
	" Enable the list of buffers:
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#fnamemod = ':t'
Plug 'bling/vim-bufferline'
	let g:bufferline_echo = 0
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
" Show marks:
Plug 'kshenoy/vim-signature'


" Navigation:
"
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
	let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|env|node_modules|bower_components)$',
	\ 'file': '\v(\.pyc|\~)$',
	\ }
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	let NERDTreeIgnore=['\~$', '\.pyc', '^__pycache__$']
""Plug 'taglist-plus'
""Plug 'kien/tabman.vim'
"Plug 'taglist.vim'
"Plug 'majutsushi/tagbar'


" CODING:
"

Plug 'google/vim-maktaba', { 'on': ['FormatCode', 'FormatLines'] }
Plug 'google/vim-codefmtlib', { 'on': ['FormatCode', 'FormatLines'] }
Plug 'google/vim-codefmt', { 'on': ['FormatCode', 'FormatLines'] }

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
	"let g:syntastic_python_checkers=['flake8', 'python', 'pylint']
	"let g:syntastic_python_checkers=['flake8', 'pylint']
	let g:syntastic_python_checkers=['flake8']
	let g:syntastic_html_tidy_exec = '/usr/sbin/tidy'
	let g:syntastic_lua_checkers = ['luac', 'luacheck']
	let g:syntastic_c_checkers = ['gcc', 'make']
	let g:ycm_show_diagnostics_ui = 0
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/neocomplete.vim'
"source ~/.vim/neocomplete.vim


" Lua:
Plug 'xolox/vim-misc', {'for': 'lua'}
       "let g:lua_complete_omni = 1
       "let g:lua_complete_dynamic = 0
Plug 'xolox/vim-lua-ftplugin', {'for': 'lua'}
       let g:lua_internal = 0

" Fish:
Plug 'dag/vim-fish', {'for': 'fish'}

" JS:
if !has('nvim')
	Plug 'marijnh/tern_for_vim', {'for': ['javascript', 'html']}
endif
Plug 'othree/html5.vim', {'for': 'html'}

" CSS:
Plug 'groenewege/vim-less', {'for': 'less'}

call plug#end()
