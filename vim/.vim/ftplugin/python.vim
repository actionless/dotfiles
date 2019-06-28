
" |||| Python stuff
" Set key 'R' for run python code
"let g:pymode_run_key = 'R'
"let g:pymode_folding = 0
set nofoldenable
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
    # exec(open(activate_this).read(), dict(__file__=activate_this))

    __file__ = activate_this
    import sys
    import os

    old_os_path = os.environ.get('PATH', '')
    os.environ['PATH'] = os.path.dirname(os.path.abspath(__file__)) + os.pathsep + old_os_path
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if sys.platform == 'win32':
        site_packages = os.path.join(base, 'Lib', 'site-packages')
    else:
        site_packages = os.path.join(base, 'lib', 'python%s' % sys.version[:3], 'site-packages')
    prev_sys_path = list(sys.path)
    import site
    site.addsitedir(site_packages)
    sys.real_prefix = sys.prefix
    sys.prefix = base
    # Move the added items to the front of the path:
    new_sys_path = []
    for item in list(sys.path):
        if item not in prev_sys_path:
            new_sys_path.append(item)
            sys.path.remove(item)
    sys.path[:0] = new_sys_path

# add current workdir to python's path
sys.path.append(os.getcwd())

EOF
endif
