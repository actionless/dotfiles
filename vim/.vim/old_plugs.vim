"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'scrooloose/syntastic'
				"let g:syntastic_python_checkers=['flake8', 'python', 'pylint']
				"let g:syntastic_python_checkers=['flake8', 'pylint']
	"let g:syntastic_python_checkers=['flake8', 'python']
	"let g:syntastic_html_tidy_exec = '/usr/sbin/tidy'
	"let g:syntastic_lua_checkers = ['luac', 'luacheck']
	"let g:syntastic_c_checkers = ['gcc', 'make']
	"let g:ycm_show_diagnostics_ui = 0
	"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
	"let g:syntastic_sh_checkers = ['sh', 'shellcheck']
				"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
				"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Completion:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! BuildYCM(info)
	"" info is a dictionary with 3 fields
	"" - name:   name of the plugin
	"" - status: 'installed', 'updated', or 'unchanged'
	"" - force:  set on PlugInstall! or PlugUpdate!
	"if a:info.status == 'installed' || a:info.force
		"!./install.py
	"endif
"endfunction
" a) always enabled:
	"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" b) enabled on insert: https://github.com/junegunn/vim-plug/wiki/faq#loading-plugins-manually
	"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'on': [] }
	"augroup load_us_ycm
		"autocmd!
		"autocmd InsertEnter * call plug#load('YouCompleteMe')
							"\| autocmd! load_us_ycm
	"augroup END
	"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Autoformatting:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'Chiel92/vim-autoformat', { 'on': ['Autoformat']}
	"let g:autoformat_autoindent = 0
	"let g:autoformat_retab = 0
	"let g:autoformat_remove_trailing_spaces = 1
	"let g:formatters_python=['yapf']

"Plug 'google/vim-maktaba', { 'on': ['FormatCode', 'FormatLines'] }
"Plug 'google/vim-codefmtlib', { 'on': ['FormatCode', 'FormatLines'] }
"" a)
	"Plug 'google/vim-codefmt', { 'on': ['FormatCode', 'FormatLines'] }
"" b)
	"Plug 'actionless/vim-codefmt', { 'branch': 'add-lua', 'on': ['FormatCode', 'FormatLines'] }



" Go:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'fatih/vim-go', {'for': 'go'}
	"let g:go_highlight_functions = 1
	"let g:go_highlight_methods = 1
	"let g:go_highlight_structs = 1
	"highlight link goStruct Type
	"let g:go_highlight_operators = 1
	"let g:go_highlight_build_constraints = 1


" Nix:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'tlib', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-actions', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-completion', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-goto-thing-at-cursor', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-errorformats', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-mw-utils', {'for': 'nix'}
"Plug 'MarcWeber/vim-addon-nix', {'for': 'nix'}


" Themes:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" term:
"Plug 'ajgrf/sprinkles'
" fixed light:
"Plug 'wimstefan/Lightning'
"Plug 'acarapetis/vim-colors-github'
"Plug 'adampasz/stonewashed-themes'
"Plug 'jlesquembre/peaksea'
" fixed dark:
"Plug 'romainl/Apprentice'
