
" |||| Python stuff
" Set key 'R' for run python code
"let g:pymode_run_key = 'R'
"let g:pymode_folding = 0
set nofoldenable
let g:syntastic_python_checkers=['flake8']
setlocal linebreak
setlocal wrap
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal colorcolumn=80
setlocal smarttab
setlocal expandtab

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
finish
endif
let b:did_ftplugin = 1


if has('nvim')
	finish
endif

if has('python3')
py3 << EOF

import os.path
import sys
import vim
# activate virtualenv
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
# add current workdir to python's path
sys.path.append(os.getcwd())

EOF
endif
