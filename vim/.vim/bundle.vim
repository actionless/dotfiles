filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Style
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'kien/rainbow_parentheses.vim'
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
Plugin 'bling/vim-airline'
	let g:airline_theme='wombat'
	"let g:airline_theme='kolor'
	let g:airline_powerline_fonts = 1
	let g:airline_right_sep = ''
	let g:airline_left_sep = ''
	" Enable the list of buffers:
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#fnamemod = ':t'
Plugin 'bling/vim-bufferline'
	let g:bufferline_echo = 0

" Navigation:
"
Plugin 'kien/ctrlp.vim'
	let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|env|node_modules|bower_components)$',
	\ 'file': '\v(\.pyc|\~)$',
	\ }
Plugin 'scrooloose/nerdtree.git'
	let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc', '^__pycache__$']
"Plugin 'taglist-plus'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'kien/tabman.vim'


" CODING:
"
Plugin 'tpope/vim-fugitive.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'

"Plugin 'Shougo/neocomplete.vim'
"source ~/.vim/neocomplete.vim


" Python:
"
"if has('python3')
	"let g:jedi#force_pycmd = 'python3'
"endif
"if has('python') || has('python3')
	"Plugin 'davidhalter/jedi-vim'
	"let g:jedi#popup_select_first = 0
	"let g:jedi#popup_on_dot = 0
"endif


" Lua:
"
	let g:lua_interpreter_path = '/usr/sbin/lua5.1'
	let g:lua_compiler_name = '/usr/sbin/luac5.1'
	"let g:lua_complete_omni = 1
	"let g:lua_complete_dynamic = 0
Plugin 'xolox/vim-lua-ftplugin'
	let g:lua_internal = 0
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-lua-inspect'

" Fish:
"
Bundle 'dag/vim-fish'

" JS:
"
Bundle 'maksimr/vim-jsbeautify'
if !has('nvim')
	Bundle 'marijnh/tern_for_vim'
endif
Bundle 'othree/html5.vim'

" CSS:
"
Bundle 'groenewege/vim-less'


" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
