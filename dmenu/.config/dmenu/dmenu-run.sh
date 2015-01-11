#!/bin/sh
#cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
#if [ -d "$cachedir" ]; then
#	cache=$cachedir/dmenu_run
#else
#	cache=$HOME/.dmenu_cache # if no xdg dir, fall back to dotfile in ~
#fi
cache=$HOME/.pcache/dmenu_run
dmenu_cmd=$HOME/.config/dmenu/dmenu.sh
theme=
(
	IFS=:
	if stest -dqr -n "$cache" $PATH; then
		stest -flx $PATH | sort -u | tee "$cache" | $dmenu_cmd "$@"
	else
		$dmenu_cmd "$@" < "$cache"
	fi
) | ${SHELL:-"/bin/sh"} &
