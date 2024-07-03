call plug#begin('~/.vim/plugged')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'actionless/simple-menu.vim'
"Plug 'editorconfig/editorconfig-vim'
Plug 'sgur/vim-editorconfig'
"Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
let g:NERDDefaultAlign = 'left'

Plug 'aklt/plantuml-syntax', {'for': ['plantuml']}
Plug 'junegunn/vader.vim', {'for': 'vader'}

Plug 'tpope/vim-speeddating', {'for': 'org'}
"Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode', {'for': 'org'}

Plug 'vim/killersheep', {'on': 'KillKillKill'}


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

let g:UltiSnipsSnippetDirectories=["ulti_snippets"]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fish:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dag/vim-fish', {'for': 'fish'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if !has('nvim')
	"Plug 'marijnh/tern_for_vim', {'for': ['javascript', 'html']}
"endif
Plug 'othree/html5.vim', {'for': 'html'}

"Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html', 'jsx']}
"Plug 'maxmellon/vim-jsx-pretty', {'for': ['javascript', 'html', 'jsx']}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSS:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'groenewege/vim-less', {'for': 'less'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Asynchronous Lint Engine & Code-Completion:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (last config block)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
""""""Plug 'andreypopp/asyncomplete-ale.vim'  " it seems to add the second
" completion instead

if executable('pylsp')
    " pip install python-lsp-server
		"\ 'workspace_config': { 'pylsp': {'plugins': {'mccabe': {'threshold': 16 }}}},
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
		\ 'workspace_config': { 'pylsp': {'plugins': {'mccabe': {'enabled': 0 }}}},
        \ })
endif

" it seems to add the second
" completion instead:
"au User asyncomplete_setup call asyncomplete#ale#register_source({
"    \ 'name': 'reason',
"    \ 'linter': 'pylsp',
"    \ })

let g:ale_completion_autoimport = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %code%: %s'
"let g:ale_sign_column_always = 1
"let g:ale_open_list = 1

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" ALE completion helper:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"function! MyAleCompletion()
"    call ale#completion#GetCompletions()
"    return "\<C-x>\<C-o>"
"endfunction

"inoremap <silent><expr> <TAB>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ "\<C-R>=MyAleCompletion()\<CR>"

"inoremap <expr><S-TAB>
"    \ pumvisible() ? "\<C-p>" :
"    \ "\<C-h>"

"set omnifunc=ale#completion#OmniFunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" AsyncComplete completion helper:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"let g:asyncomplete_auto_popup = 0

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()


"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'


"\	 'python': ['flake8', 'mypy', 'pylint', 'pylsp', 'vulture'],
"\	 'python': ['ruff', 'pylsp'],
\	 'python': ['mypy', 'pylint', 'pylsp', 'vim-lsp'],
let g:ale_linters = {
\	 'python': ['mypy', 'pylint'],
\	 'javascript': ['eslint', 'fecs', 'flow', 'flow-language-server', 'jscs', 'standard', 'tsserver', 'xo'],
\}
"let g:ale_linters_ignore = {
"\	 'python': ['pylsp']
"\}
"set completeopt=menu,menuone,popup,noselect,noinsert

let g:ale_python_pylsp_executable = 'pylsp'
let g:ale_python_pylint_change_directory = 0
"let g:ale_python_mypy_options = ' --ignore-missing-imports '
"let g:ale_python_vulture_options = ' ./maintenance_scripts/vulture_whitelist.py '
"let g:ale_python_ruff_options = ' --config pyproject.toml '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"##############################################################################
