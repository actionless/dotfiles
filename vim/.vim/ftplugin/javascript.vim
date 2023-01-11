" |||| JS stuff
let g:syntastic_javascript_checkers = ['jscs', 'jshint']
"let g:syntastic_javascript_checkers = ['jshint']
setlocal linebreak
setlocal wrap
setlocal tabstop=8

setlocal softtabstop=2
setlocal shiftwidth=2

setlocal softtabstop=4
setlocal shiftwidth=4

setlocal textwidth=80
setlocal colorcolumn=80
setlocal smarttab
setlocal expandtab
autocmd FileType javascript noremap <buffer>  <leader><c-f> :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>

autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd FileType html noremap <buffer> <leader><c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader><c-f> :call CSSBeautify()<cr>

let g:NERDSpaceDelims = 1
