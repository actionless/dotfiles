call plug#begin('~/.vim/plugged')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'actionless/simple-menu.vim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Style:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
	let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|env|node_modules|bower_components)$',
	\ 'file': '\v(\.pyc|\~)$',
	\ }
"Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fish:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dag/vim-fish', {'for': 'fish'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
	Plug 'marijnh/tern_for_vim', {'for': ['javascript', 'html']}
endif
Plug 'othree/html5.vim', {'for': 'html'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSS:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'groenewege/vim-less', {'for': 'less'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

" don't show popup automatically and bind it to <TAB>:
let g:asyncomplete_auto_popup = 0
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

""let g:asyncomplete_remove_duplicates = 1
"" show preview:
"set completeopt+=preview
"" hide preview after:
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"if executable('pyls')
	"" pacman -S python-language-server
	"au User lsp_setup call lsp#register_server({
		"\ 'name': 'pyls',
		"\ 'cmd': {server_info->['pyls']},
		"\ 'whitelist': ['python'],
		"\ })
"endif

"if executable('docker-langserver')
	"au User lsp_setup call lsp#register_server({
		"\ 'name': 'docker-langserver',
		"\ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
		"\ 'whitelist': ['dockerfile'],
		"\ })
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Asynchronous Lint Engine:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'w0rp/ale'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %code%: %s'
"let g:ale_open_list = 1

let g:ale_linters = {
\	 'python': ['flake8', 'mypy', 'pylint', 'pyls'],
\}
let b:ale_linters_ignore = ['pyls']
let g:ale_python_mypy_options = '--ignore-missing-imports'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"##############################################################################
