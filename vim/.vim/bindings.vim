let mapleader = ","

" sudo write
noremap <leader>W :w !sudo tee %<CR>

map <C-N><C-T> :NERDTreeToggle<CR>
map <C-N><C-N> :set invnumber<CR>

map <leader>bb :CtrlPBuffer<CR>
"map <C-M><C-N> :bnext!<CR>
"map <C-M><C-P> :bprevious!<CR>
"map <C-M><C-C> :Bclose<CR>

noremap <leader>fl :FormatLines<CR>
noremap <leader>fc :FormatCode<CR>

noremap <leader>] :tabnext<CR>
noremap <leader>[ :tabprevious<CR>
noremap <leader>tn :tabnew<CR>
noremap <leader>td :tabclose<CR>

vnoremap < <gv
vnoremap > >gv
