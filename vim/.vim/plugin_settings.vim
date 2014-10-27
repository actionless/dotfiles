
" |||| AIRLINE ||||
"let g:airline_theme='wombat'
let g:airline_theme='kolor'
let g:airline_powerline_fonts = 1
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:bufferline_echo = 0
set ttimeoutlen=30
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" |||| RainbowParenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" |||| NERD Tree
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc', '^__pycache__$']

" |||| CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|env|node_modules)$',
  \ 'file': '\v(\.pyc|\~)$',
  \ }

" ||||| other plugins' settings
