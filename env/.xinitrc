#!/bin/bash

#export XDG_CURRENT_DESKTOP=gnome
export XDG_CURRENT_DESKTOP=xfce
export LC_ALL=en_US.UTF-8

#~/.screenlayout/tp.sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#/usr/bin/xscreensaver -no-splash &

#~/.scripts/tp_unmute.sh

# moved to awesome:
#
#start-pulseaudio-x11 &
#
#xsettingsd &
#xfsettingsd &

export LC_ALL=en_US.UTF-8
. ~/.profile

test -f /usr/bin/vmware-user-suid-wrapper && /usr/bin/vmware-user-suid-wrapper || true

session="$2"
#if [ -z "$session" ]
#then
	##session='openbox'
	#session='awesome'
	#session='awesome_no_argb'
#fi

case "$session" in
openbox)
	openbox-session &
	bash ~/.config/openbox/autostart ; true
	;;
awesome)
	#./.screenlayout/bigdell.sh ;
	(sleep 3 && compton) &
	exec awesome >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	;;
awesome_no_argb)
	#./.screenlayout/bigdell.sh ;
	#exec awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	exec awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	;;
awesome_debug)
	#exec awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	exec st -e awesome --no-argb
	;;
awesome_debug2)
	#exec awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
	exec awesome --no-argb
	;;
awesome_kde)
	#export KDEWM="/usr/sbin/awesome --no-argb >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr"
	export KDEWM="awesome"
	exec startkde	;;
*)
	exec "$session" >> ~/.cache/sessout 2>> ~/.cache/sesserr
	;;
esac
