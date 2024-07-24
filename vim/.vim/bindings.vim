"<BEGIN>=======================================================================

"" Free: ----------------------------------------------------------------------
" Ctrl+K
" Ctrl+S -- now busy with UltiSnips: insert <S>nippet
" Ctrl+L (redraw) -- now busy with UltiSnips: <L>ist snippets
" Ctrl+N (emacs)
" Ctrl+Q (Ctrl+V dup)
" Ctrl+J (return)

map <C-P> :CtrlP<CR>

"==============================================================================
"
" \ - seems to be unbound
" ; - repeat T/t/F/f
" , - reverse T/t/F/f

"let mapleader = ","
"let maplocalleader = "\\"
"noremap <leader> :call MyMainMenu()<CR>
"noremap <C-K> :call MyMainMenu()<CR>

let mapleader = "\\"
let maplocalleader = ";"
noremap , :call MyMainMenu()<CR>
vnoremap , :<C-U>call MyMainMenu(1)<CR>


"==============================================================================
" Override&extend default VIM keybindings: ------------------------------------
"==============================================================================

vnoremap < <gv
vnoremap > >gv

"noremap n nzz


"==============================================================================
" Fix Ctrl+Left/Right Arrows
"==============================================================================
" it was like that til november 2020 (but wasn't even needed):
"map <ESC>[5D <C-Left>
"map <ESC>[5C <C-Right>
"map! <ESC>[5D <C-Left>
"map! <ESC>[5C <C-Right>
" but next either in vim or terminfo smth changed:
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
map! <ESC>[1;5D <C-Left>
map! <ESC>[1;5C <C-Right>


"==============================================================================
" OLD leader-bindings which are moved to the menu now: ------------------------
"==============================================================================

" sudo write
"noremap <leader>W :w !sudo tee %<CR>

"map <leader>bb :CtrlPBuffer<CR>

""noremap <leader>fl :FormatLines<CR>
""noremap <leader>fc :FormatCode<CR>
""noremap <leader>af :Autoformat<CR>
""autocmd FileType python noremap <leader>r :0,$!reindent<Cr>
""autocmd FileType python noremap <leader>f :0,$!format_code.py<Cr>

"noremap <leader>ig :IndentGuidesToggle<CR>

"noremap <leader>tt :TagbarToggle<CR>
"noremap <leader>ft :Lex<CR>
"noremap <leader>nn :set invnumber<CR>

"noremap <leader>p pgvyk<CR>
"noremap <leader>P Vpgvyk<CR>


"==============================================================================
" MAIN MENU: ------------------------------------------------------------------
"==============================================================================

function! MyMainMenu(...)
	let l:visual = get(a:, 1, 0)
	let l:main_menu = []
	let l:main_menu += [
		\	[']', 'tab next', ':tabnext'],
		\	['[', 'tab previous', ':tabprevious'],
		\	['b', 'buffer menu', 'MyBufferMenu'],
		\	['c', ':call MyCommentsMenu('.l:visual.')'],
		\	['f', 'file browser', ':Lex'],
		\	['i', 'indentation', 'MyIndentMenu'],
		\	['l', 'ALE menu', 'MyAleMenu'],
		\	['n', 'lineNumbers menu', 'MyNumbersMenu'],
		\	['p', 'paste overwrite', 'normal! gvpgvy'],
		\	['P', 'paste overwrite line', 'normal! Vpgvy'],
		\	['t', 'tabs and tags menu', 'MyTabsAndTagsMenu'],
		\	['W', 'save as root', ':w !sudo tee %'],
		\	['w', 'window menu', 'MyWindowMenu'],
	\ ]
	if &diff
		let l:main_menu += [
		\	['d', 'diff menu', 'MyDiffMenu'],
		\ ]
	elseif &filetype == 'python'
		let l:main_menu += [
		\	['d', 'pylint disable', 'normal! A  # pylint: disable='],
		\ ]
	endif
	call SimpleMenu(l:main_menu)
endfunction

"==============================================================================
" Sub-menus: ------------------------------------------------------------------
"==============================================================================

function! MyBufferMenu()
	call SimpleMenu([
		\	['b', 'choose buffer', ':CtrlPBuffer'],
		\	['c', 'close buffer', ':Bclose'],
		\	['n', 'next buffer', ':bnext!'],
		\	['p', 'next buffer', ':bprevious!'],
	\ ])
endfunction

function! MyCommentsMenu(...)
	let l:visual = get(a:, 1, 0)
	" plugin/nerdcommenter.vim +82
	let l:main_menu = []
	if l:visual
		let l:main_menu += [
		\	[' ', 'toggle comment selection', ":'<,'>call nerdcommenter#Comment('n', 'Toggle')"],
		\ ]
	else
		let l:main_menu += [
		\	[' ', 'toggle comment line', ":call nerdcommenter#Comment('n', 'Toggle')"],
		\ ]
	endif
	let l:main_menu += [
		\	['a', 'switch to alternate delimiters', ":call nerdcommenter#SwitchToAlternativeDelimiters(1)"],
		\	['c', 'toggle comment', ":call nerdcommenter#Comment('n', 'Comment')"],
	\ ]
	call SimpleMenu(l:main_menu)
endfunction

function! MyDiffMenu()
	call SimpleMenu([
		\   ['g', ':diffget'],
		\   ['p', ':diffput'],
		\	['u', ':diffupdate'],
		\	['r', ':diffget RE'],
		\	['b', ':diffget BA'],
		\	['l', ':diffget LO'],
	\ ])
endfunction

function! MyIndentMenu()
	call SimpleMenu([
		\	['g', ':IndentGuidesToggle'],
	\ ])
endfunction

function! MyNumbersMenu()
	call SimpleMenu([
		\	['n', ':set invnumber'],
	\ ])
endfunction

function! MyTabsAndTagsMenu()
	call SimpleMenu([
		\	['n', 'tab new', ':tabnew'],
		\	['d', 'tab close', ':tabclose'],
		\	['t', ':TagbarToggle'],
	\ ])
endfunction

function! MyWindowMenu()
	call SimpleMenu([
		\	['k', 'close above', ':wincmd k | wincmd c'],
		\	['j', 'close below', ':wincmd j | wincmd c'],
	\ ])
endfunction

"==============================================================================
" ALE-specific menu: ----------------------------------------------------------
"==============================================================================

function! MyAleFixMenu()
	let l:fix_menu = []
	let l:fix_menu += [
		\	['s', ':ALEFixSuggest'],
		\	['t', ':ALEFix remove_trailing_lines'],
		\	['w', ':ALEFix trim_whitespace'],
		\	['4', '<TAB> to 4 spaces', ':%s/	/    /g'],
		\	['2', '<TAB> to 2 spaces', ':%s/	/  /g'],
	\ ]
	if &filetype == 'python'
		let l:fix_menu += [
		\	['a', ':ALEFix autopep8'],
		\	['b', ':ALEFix black'],
		\	['i', ':ALEFix isort'],
		\	['y', ':ALEFix yapf'],
		\ ]
	endif
	call SimpleMenu(l:fix_menu)
endfunction

function! MyAleMenu()
	let l:root_menu = [
		\	['o', ':ALEToggle'],
		\	['d', ':ALEDetail'],
		\	['h', ':ALEHover'],
		\	['n', ':ALENextWrap'],
		\	['p', ':ALEPreviousWrap'],
		\	['i', ':ALEInfo'],
		\	['r', ':ALEFindReferences'],
		\	['d', ':ALEGoToDefinition'],
		\	['t', ':ALEGoToDefinitionInTab'],
		\	['f', 'Fix...', ':call MyAleFixMenu()'],
	\ ]
	call SimpleMenu(l:root_menu)
endfunction
"<END>=========================================================================
