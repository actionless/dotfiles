filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Style
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'

" Tools
Plugin 'tpope/vim-fugitive.git'

" Navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'taglist-plus'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'kien/tabman.vim'
"Plugin 'altercation/vim-colors-solarized'

" CODING:

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'

"Plugin 'Shougo/neocomplete.vim'
"source ~/.vim/neocomplete.vim 



" Python
if has('python') || has('python3')
	Plugin 'davidhalter/jedi-vim'
	let g:jedi#popup_select_first = 0
	let g:jedi#popup_on_dot = 0
endif
if has('python3')
	let g:jedi#force_pycmd = 'python3'
endif
if has('python') && !has('nvim')
	Plugin 'Valloric/YouCompleteMe'
endif


" Lua
let g:lua_interpreter_path = '/usr/sbin/lua5.1'
let g:lua_compiler_name = '/usr/sbin/luac5.1'
"let g:lua_complete_omni = 1
"let g:lua_complete_dynamic = 0
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-lua-inspect'
Plugin 'xolox/vim-lua-ftplugin'

" Fish
Bundle 'dag/vim-fish'

" JS
Bundle 'maksimr/vim-jsbeautify'
Bundle 'marijnh/tern_for_vim'

"CSS
Bundle 'groenewege/vim-less'

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


