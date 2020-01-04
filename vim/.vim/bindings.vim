"" Free:
" Ctrl+K
" Ctrl+S -- now busy with UltiSnips: insert <S>nippet
" Ctrl+L (redraw) -- now busy with UltiSnips: <L>ist snippets
" Ctrl+N (emacs)
" Ctrl+Q (Ctrl+V dup)
" Ctrl+J (return)
"


vnoremap < <gv
vnoremap > >gv


let mapleader = ","
let maplocalleader = "\\"


" sudo write
noremap <leader>W :w !sudo tee %<CR>

map <C-P> :CtrlP<CR>
map <leader>bb :CtrlPBuffer<CR>
"map <C-M><C-N> :bnext!<CR>
"map <C-M><C-P> :bprevious!<CR>
"map <C-M><C-C> :Bclose<CR>

"noremap <leader>fl :FormatLines<CR>
"noremap <leader>fc :FormatCode<CR>
"noremap <leader>af :Autoformat<CR>
"autocmd FileType python noremap <leader>r :0,$!reindent<Cr>
"autocmd FileType python noremap <leader>f :0,$!format_code.py<Cr>

noremap <leader>ig :IndentGuidesToggle<CR>

noremap <leader>tt :TagbarToggle<CR>
noremap <leader>ft :Lex<CR>
noremap <leader>nn :set invnumber<CR>

noremap <leader>p pgvyk<CR>
noremap <leader>P Vpgvyk<CR>


function! MyMainMenu()
	call SimpleMenu([
		\	[']', 'tab next', ':tabnext'],
		\	['[', 'tab previous', ':tabprevious'],
		\	['t', 'tab menu', 'MyTabMenu'],
		\	['w', 'window menu', 'MyWindowMenu'],
		\	['l', 'ALE menu', 'MyAleMenu'],
	\ ])
endfunction
"execute "noremap " . menu_key . " :call MyMainMenu()<CR>"
noremap <leader> :call MyMainMenu()<CR>

function! MyTabMenu()
	call SimpleMenu([
		\	['n', 'tab next', ':tabnew'],
		\	['d', 'tab previous', ':tabclose'],
	\ ])
endfunction

function! MyWindowMenu()
	call SimpleMenu([
		\	['k', 'close above', ':wincmd k | wincmd c'],
		\	['j', 'close below', ':wincmd j | wincmd c'],
	\ ])
endfunction
noremap <leader>w :call MyWindowMenu()<CR>

function! MyAleFixMenu()
	let l:base_menu = [
		\	['s', ':ALEFixSuggest'],
		\	['t', ':ALEFix remove_trailing_lines'],
		\	['w', ':ALEFix trim_whitespace'],
		\	['4', '<TAB> to 4 spaces', ':%s/	/    /g'],
		\	['2', '<TAB> to 2 spaces', ':%s/	/  /g'],
	\ ]
	if &filetype == 'python'
		let l:filetype_menu = [
			\	['a', ':ALEFix autopep8'],
			\	['b', ':ALEFix black'],
			\	['i', ':ALEFix isort'],
			\	['y', ':ALEFix yapf'],
		\ ]
	else
		let l:filetype_menu = []
	endif
	call SimpleMenu(l:base_menu + l:filetype_menu)
endfunction
function! MyAleMenu()
	call SimpleMenu([
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
	\ ])
endfunction
noremap <leader>l :call MyAleMenu()<CR>
