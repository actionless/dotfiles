#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ -f ~/.Xresources_theme ]] ; then
	basename $(dirname $(readlink -e ~/.Xresources_theme)) || (
		echo "Not bootstrapped"
		exit 1
	)
else
	echo "Not bootstrapped"
	exit 2
fi
