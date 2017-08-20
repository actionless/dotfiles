#!/bin/sh
if [[ -f ~/.Xresources ]] ; then
	basename $(dirname $(readlink -e ~/.Xresources)) || (
		echo "Not bootstrapped"
		exit 1
	)
else
	echo "Not bootstrapped"
	exit 2
fi
