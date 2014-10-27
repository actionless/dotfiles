# .zlogin is sourced in login shells.  It should
# contain commands that should be executed only in
# login shells.  It should be used to set the terminal
# type and run a series of external commands (fortune,
# msgs, from, etc).
#clear
stty dec new cr0 -tabs
ttyctl -f  # freeze the terminal modes... can't change without a ttyctl -u
mesg y
log
from 2>/dev/null
cat notes
msgs -fp
#export XDG_CURRENT_DESKTOP=gnome
export XDG_CURRENT_DESKTOP=xfce
echo "LCARZsh initialized!"

