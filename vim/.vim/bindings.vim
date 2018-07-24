"" Free:
" Ctrl+K
" Ctrl+S -- now busy with UltiSnips: insert <S>nippet
" Ctrl+L (redraw) -- now busy with UltiSnips: <L>ist snippets
" Ctrl+N (emacs)
" Ctrl+Q (Ctrl+V dup)
" Ctrl+J (return)
"


let mapleader = ","


" sudo write
noremap <leader>W :w !sudo tee %<CR>

map <C-P> :CtrlP<CR>
map <leader>bb :CtrlPBuffer<CR>
"map <C-M><C-N> :bnext!<CR>
"map <C-M><C-P> :bprevious!<CR>
"map <C-M><C-C> :Bclose<CR>

"noremap <leader>fl :FormatLines<CR>
"noremap <leader>fc :FormatCode<CR>
noremap <leader>af :Autoformat<CR>
autocmd FileType python nnoremap <leader>r :0,$!reindent<Cr>
autocmd FileType python nnoremap <leader>f :0,$!format_code.py<Cr>

autocmd FileType python vnoremap <leader>r :0,$!reindent<Cr>
autocmd FileType python vnoremap <leader>f :0,$!format_code.py<Cr>

noremap <leader>ig :IndentGuidesToggle<CR>

noremap <leader>] :tabnext<CR>
noremap <leader>[ :tabprevious<CR>
noremap <leader>tn :tabnew<CR>
noremap <leader>td :tabclose<CR>

noremap <leader>tt :TagbarToggle<CR>
noremap <leader>ft :Lex<CR>
noremap <leader>nt :Lex<CR>
noremap <leader>nn :set invnumber<CR>

noremap <leader>p pgvyk<CR>
noremap <leader>P Vpgvyk<CR>

vnoremap < <gv
vnoremap > >gv


function! MyAlePopup()
	call SimpleMenu([
		\	['d', 'ALEDetail'],
		\	['n', 'ALENext'],
		\	['p', 'ALEPrevious'],
		\	['i', 'ALEInfo'],
	\ ])
endfunction
noremap <leader>l :call MyAlePopup()<CR>
