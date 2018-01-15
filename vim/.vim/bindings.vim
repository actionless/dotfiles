"" Free:
" Ctrl+K
" Ctrl+S -- now busy with UltiSnips
" Ctrl+L (redraw)
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
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd FileType python nnoremap <leader>yr :0,$!yapf<Cr>
autocmd FileType python nnoremap <leader>p :0,$!autopep8 --experimental --aggressive  -<Cr>
autocmd FileType python nnoremap <leader>r :0,$!reindent<Cr>
autocmd FileType python nnoremap <leader>f :0,$!format_code.py<Cr>

noremap <leader>ig :IndentGuidesToggle<CR>

noremap <leader>] :tabnext<CR>
noremap <leader>[ :tabprevious<CR>
noremap <leader>tn :tabnew<CR>
noremap <leader>td :tabclose<CR>

noremap <leader>tt :TagbarToggle<CR>
noremap <leader>ft :Lex<CR>
noremap <leader>nt :Lex<CR>
noremap <leader>nn :set invnumber<CR>

map <leader>p pgvyk<CR>
map <leader>P Vpgvyk<CR>

vnoremap < <gv
vnoremap > >gv
