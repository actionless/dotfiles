#!/bin/sh
stow -D $(./current-theme.sh) ;
if test -z "$1"; then
	ls | grep theme- | bemenu -p "select theme:" | xargs stow
else
	stow "$1"
fi
xrdb -merge $HOME/.Xresources
source ~/.profile
echo "awesome.restart()" | awesome-client || true
pgrep "^st\$" | xargs kill -s USR1
for line in $(env | grep -e ^TMUX_ -e ^FISH_ -e ^TERM_ | grep -v TMUX_PANE) ; do tmux setenv -g $(tr '=' ' ' <<< $line) ; done;
tmux source-file ~/.tmux.conf
fish -c reload_fish
