call plug#begin('~/.vim/plugged')

" Style:
"
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'less', 'sass', 'scss', 'vim', 'stylus', 'xdefaults']}
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Enable the list of buffers:
	"let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#fnamemod = ':t'
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
"Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar'


" CODING:
"

Plug 'editorconfig/editorconfig-vim'

"Plug 'google/vim-maktaba', { 'on': ['FormatCode', 'FormatLines'] }
"Plug 'google/vim-codefmtlib', { 'on': ['FormatCode', 'FormatLines'] }
""and
"Plug 'google/vim-codefmt', { 'on': ['FormatCode', 'FormatLines'] }
""or
"Plug 'actionless/vim-codefmt', { 'branch': 'add-lua', 'on': ['FormatCode', 'FormatLines'] }

Plug 'Chiel92/vim-autoformat', { 'on': ['Autoformat']}
	let g:autoformat_autoindent = 0
	let g:autoformat_retab = 0
	let g:autoformat_remove_trailing_spaces = 1
	let g:formatters_python=['yapf']

"Plug 'tpope/vim-fugitive'

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

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }
" https://github.com/junegunn/vim-plug/wiki/faq#loading-plugins-manually
augroup load_us_ycm
	autocmd!
	autocmd InsertEnter * call plug#load('YouCompleteMe')
						 \| autocmd! load_us_ycm
augroup END
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
"Plug 'fatih/vim-go', {'for': 'go'}
	"let g:go_highlight_functions = 1
	"let g:go_highlight_methods = 1
	"let g:go_highlight_structs = 1
	"highlight link goStruct Type
	"let g:go_highlight_operators = 1
	"let g:go_highlight_build_constraints = 1

" Nix:
"Plug 'tlib', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-actions', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-completion', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-goto-thing-at-cursor', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-errorformats', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-mw-utils', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-nix', {'for': 'nix'}

" Themes:
"
" term:
"Plug 'ajgrf/sprinkles'
" fixed light:
"Plug 'wimstefan/Lightning'
"Plug 'acarapetis/vim-colors-github'
"Plug 'adampasz/stonewashed-themes'
"Plug 'jlesquembre/peaksea'
" fixed dark:
"Plug 'romainl/Apprentice'

call plug#end()
