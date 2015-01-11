#!/bin/sh
stow -D $(./current-theme.sh) ;
if test -z "$1"; then
       	ls | grep theme- | bemenu | xargs stow
else
	stow "$1"
fi
