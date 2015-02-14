call plug#begin('~/.vim/plugged')

" Style:
"
Plug 'gorodinskiy/vim-coloresque'
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
Plug 'nathanaelkane/vim-indent-guides'


" Navigation:
"
Plug 'kien/ctrlp.vim'
	let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|env|node_modules|bower_components)$',
	\ 'file': '\v(\.pyc|\~)$',
	\ }
Plug 'scrooloose/nerdtree'
	let NERDTreeIgnore=['\~$', '\.pyc', '^__pycache__$']
"Plug 'taglist-plus'
Plug 'taglist.vim'
Plug 'majutsushi/tagbar'
"Plug 'kien/tabman.vim'


" CODING:
"

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmtlib'
Plug 'google/vim-codefmt'

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
	"let g:syntastic_python_checkers=['flake8', 'python', 'pylint']
	let g:syntastic_python_checkers=['flake8', 'pylint']
	"let g:syntastic_python_checkers=['pylint']
	"let g:syntastic_python_checkers=['flake8']
	let g:syntastic_html_tidy_exec = '/usr/sbin/tidy'
	let g:syntastic_lua_checkers = ['luac', 'luacheck']
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/neocomplete.vim'
"source ~/.vim/neocomplete.vim


" Lua:
       let g:lua_interpreter_path = '/usr/sbin/lua5.1'
       let g:lua_compiler_name = '/usr/sbin/luac5.1'
       "let g:lua_complete_omni = 1
       "let g:lua_complete_dynamic = 0
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
       let g:lua_internal = 0

" Fish:
Plug 'dag/vim-fish'

" JS:
Plug 'maksimr/vim-jsbeautify'
if !has('nvim')
	Plug 'marijnh/tern_for_vim'
endif
Plug 'othree/html5.vim'

" CSS:
Plug 'groenewege/vim-less'

call plug#end()
