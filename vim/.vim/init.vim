set nocompatible               " be iMproved
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set shiftwidth=4
set tabstop=4

set wildmenu
set wildmode=list:longest
"set wildmode=full

set ttyfast

set nobackup
set nowritebackup
set noswapfile

set number
set relativenumber

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set incsearch		" do incremental searching
set hlsearch
set ignorecase
set smartcase

let g:netrw_winsize=20

set clipboard=unnamedplus	" use system clipboard

filetype off                   " required for Plug
filetype plugin indent on     " required for Plug and Dein
syntax on

set linebreak
set wrap
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
set colorcolumn=80
set smarttab
"set expandtab

if has('nvim')
	source ~/.vim/neovim.vim
endif

set ttimeoutlen=30
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
" fish shell workaround
if &shell =~# 'fish$'
    set shell=bash
endif

"if &term =~ '256color'
    "" disable Background Color Erase (BCE) so that color schemes
    "" render properly when inside 256-color tmux and GNU screen.
    "" see also http://sunaku.github.io/vim-256color-bce.html
    "set t_ut=
"endif

"=============================================================================

if v:progname =~? "editor"
  finish
elseif v:progname =~? "view"
  finish
"elseif v:progname =~? "vi"
"  finish
endif


source ~/.vim/plug.vim
set laststatus=2
source ~/.vim/default_config.vim
source ~/.vim/bindings.vim


source ~/.vim/theme.vim
if filereadable(expand('~/.vim/theme_local.vim'))
	source ~/.vim/theme_local.vim
endif

" Should go in the last place
" otherwise Syntax event won't be applied correctly
au VimEnter * RainbowParenthesesToggleAll
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"
endif
