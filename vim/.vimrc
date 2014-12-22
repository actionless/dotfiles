set nocompatible               " be iMproved
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest

set ttyfast

set nobackup
set nowritebackup
set noswapfile

set number
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set incsearch		" do incremental searching
set hlsearch
set ignorecase
set smartcase

set clipboard=unnamedplus	" use system clipboard

filetype off                   " required!
filetype plugin indent on     " required!
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


source ~/.vim/theme.vim

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

"=============================================================================

if v:progname =~? "editor"
  finish
elseif v:progname =~? "view"
  finish
"elseif v:progname =~? "vi"
"  finish
endif


source ~/.vim/bundle.vim
set laststatus=2
source ~/.vim/default_config.vim
source ~/.vim/bindings.vim
