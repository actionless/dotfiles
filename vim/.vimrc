" Note: Skip initialization for vim-tiny or vim-small.
if 1
	execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/init.vim'
endif
