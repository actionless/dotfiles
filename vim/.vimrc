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

set clipboard=unnamed	" use system clipboard

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


"|||||||___LOAD_LE_BUNDLES:___|||||||||||||||||

source ~/.vim/bundle.vim

set laststatus=2
"||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif

" Don't use Ex mode, use Q for formatting
vmap Q gq
nmap Q gqap

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif


" |||| PLUGIN SETTINGS ||||
source ~/.vim/plugin_settings.vim


" ||||| BINDINGS
source ~/.vim/bindings.vim
