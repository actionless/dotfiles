# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

test -z "$profile" && . /etc/profile || true

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# include sbin in PATH
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi
if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
export LANG="en_US.utf8"
export GDM_LANG="en_US.utf8"

export VDPAU_DRIVER=radeonsi

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
#export GOPATH=$HOME/.go
export GOPATH=/media/ext/.go

# uncomment one when not in GNOME:
export XDG_CURRENT_DESKTOP=gnome
#export XDG_CURRENT_DESKTOP=xfce

#export QT_STYLE_OVERRIDE=gtk
#export QT_QPA_PLATFORMTHEME='qgnomeplatform'
export QT_QPA_PLATFORMTHEME='qt5ct'

## HiDPI
# GTK3
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
# Qt5.6+
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=0
# Qt5 legacy
export QT_DEVICE_PIXEL_RATIO=2
# other
export CHROMIUM_USER_FLAGS=" --force-device-scale-factor=2 "

# turn off touch screen support to workaround some mouse input bugs:
export GDK_CORE_DEVICE_EVENTS=1
export QT_XCB_NO_XI2_MOUSE=1

export VST_PATH=/usr/lib/vst:/usr/local/lib/vst:$HOME/.vst:$HOME/.vst-bridges/
export LXVST_PATH=/usr/lib/lxvst:/usr/local/lib/lxvst:~/.lxvst:/someother/custom/dir
export LADSPA_PATH=/usr/lib/ladspa:/usr/local/lib/ladspa:~/.ladspa:/someother/custom/dir
export LV2_PATH=/usr/lib/lv2:/usr/local/lib/lv2:~/.lv2:/someother/custom/dir
export DSSI_PATH=/usr/lib/dssi:/usr/local/lib/dssi:~/.dssi:/someother/custom/dir
