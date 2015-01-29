#!/bin/sh
stow -D $(./current-theme.sh) ;
if test -z "$1"; then
	ls | grep theme- | bemenu -p "select theme:" | xargs stow
else
	stow "$1"
fi
xrdb -merge ~/.Xresources
echo "awesome.restart()" | awesome-client
