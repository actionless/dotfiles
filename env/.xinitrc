#!/bin/bash

#export XDG_CURRENT_DESKTOP=gnome
export XDG_CURRENT_DESKTOP=xfce
export LC_ALL=en_US.UTF-8

~/.screenlayout/tp.sh

#arch:
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
#ubuntu:
#if [ -d /etc/X11/Xsession.d ]; then
# for f in /etc/X11/Xsession.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.xscreensaver ;
xrdb -merge ~/.Xresources ;

#/usr/bin/xscreensaver -no-splash &

~/.scripts/tp_unmute.sh

# moved to awesome:
#
#start-pulseaudio-x11 &
#
#xsettingsd &
#xfsettingsd &

export LC_ALL=en_US.UTF-8

session="$1"
if [ -z "$session" ]
then
	#session='openbox'
	session='awesome'
	session='awesome_no_argb'
fi

case "$session" in
openbox)
	#bash /etc/X11/xinit/xinitrc
	exec openbox-session
	bash ~/.config/openbox/autostart
	;;
awesome)
	#exec awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	exec awesome >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	;;
awesome_no_argb)
	#exec awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	exec awesome -no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	;;
awesome_kde_no_argb)
	#export KDEWM="/usr/sbin/awesome -no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr"
	export KDEWM="awesome"
	exec startkde	;;
*)
	exec "$session"
	;;
esac

