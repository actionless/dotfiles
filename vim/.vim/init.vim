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

set history=50 " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands

set incsearch  " do incremental searching
set hlsearch
set ignorecase
set smartcase

let g:netrw_winsize=20

set clipboard=unnamedplus " use system clipboard

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
set noshowmode

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
    "set t_ts=]0;
    "set t_fs=0
    execute "set t_ts=\e]0;"
    execute "set t_fs=\e0"
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

source ~/.vim/default_config.vim

if v:progname =~? "editor"
  finish
elseif v:progname =~? "view"
  finish
"elseif v:progname =~? "vi"
"  finish
endif

"=============================================================================

source ~/.vim/plug_config.vim

set laststatus=2

source ~/.vim/bindings.vim

source ~/.vim/caret_shape.vim

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

"https://github.com/awesomeWM/awesome/issues/2291#issuecomment-398610795
"au VimEnter * redraw!

" this will source local .vimrc:
for p in [
        \ '/home/'.$USER.'/ai/',
        \ '/home/'.$USER.'/coding/',
        \ '/home/'.$USER.'/Dropbox/notes',
        \ '/home/'.$USER.'/projects/',
        \ '/home/'.$USER.'/work/',
        \ '/media/ext/',
\ ]
    if stridx(expand('%:p:h'), p) == 0
        autocmd VimEnter * echo " :: loaded local .vimrc ! 🖖😼"
        set exrc
    endif
endfor

"END
