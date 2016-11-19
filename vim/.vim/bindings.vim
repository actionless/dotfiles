"" Free:
" Ctrl+K
" Ctrl+S
" Ctrl+L (redraw)
" Ctrl+N (emacs)
" Ctrl+Q (Ctrl+V dup)
" Ctrl+J (return)
"


let mapleader = ","

" sudo write
noremap <leader>W :w !sudo tee %<CR>

"map <C-N><C-N> :set invnumber<CR>

map <C-P> :CtrlP<CR>
map <leader>bb :CtrlPBuffer<CR>
"map <C-M><C-N> :bnext!<CR>
"map <C-M><C-P> :bprevious!<CR>
"map <C-M><C-C> :Bclose<CR>

"noremap <leader>fl :FormatLines<CR>
"noremap <leader>fc :FormatCode<CR>
noremap <leader>af :Autoformat<CR>

noremap <leader>ig :IndentGuidesToggle<CR>

noremap <leader>] :tabnext<CR>
noremap <leader>[ :tabprevious<CR>
noremap <leader>tn :tabnew<CR>
noremap <leader>td :tabclose<CR>

noremap <leader>tt :TagbarToggle<CR>
noremap <leader>ft :Lex<CR>
noremap <leader>nt :Lex<CR>
noremap <leader>nn :set invnumber<CR>

vnoremap < <gv
vnoremap > >gv
