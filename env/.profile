# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# shellcheck source=/dev/null

if test -z "${profile:-}" ; then . /etc/profile ; fi

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

if test -z "${XDG_RUNTIME_DIR}" ; then
    XDG_RUNTIME_DIR=/run/user/$(id -u)
    export XDG_RUNTIME_DIR
fi

export LANGUAGE="en_US.utf8"
export LC_ALL="en_US.utf8"
export LANG="en_US.utf8"
export GDM_LANG="en_US.utf8"

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export GOPATH=$HOME/.go

# uncomment one when not in GNOME:
export XDG_CURRENT_DESKTOP=gnome
#export XDG_CURRENT_DESKTOP=xfce

#export QT_STYLE_OVERRIDE=gtk
#export QT_QPA_PLATFORMTHEME='qgnomeplatform'
#export QT_QPA_PLATFORMTHEME='gtk2'
export QT_QPA_PLATFORMTHEME='qt5ct'
export DO_NOT_UNSET_QT_QPA_PLATFORMTHEME=1
export DO_NOT_SET_DESKTOP_SETTINGS_UNAWARE=1

export _JAVA_AWT_WM_NONREPARENTING=1

export VST_PATH=/usr/lib/vst:/usr/local/lib/vst:$HOME/.vst:$HOME/.vst-bridges/
export LXVST_PATH=/usr/lib/lxvst:/usr/local/lib/lxvst:~/.lxvst:/someother/custom/dir
export LADSPA_PATH=/usr/lib/ladspa:/usr/local/lib/ladspa:~/.ladspa:/someother/custom/dir
export LV2_PATH=/usr/lib/lv2:/usr/local/lib/lv2:~/.lv2:/someother/custom/dir
export DSSI_PATH=/usr/lib/dssi:/usr/local/lib/dssi:~/.dssi:/someother/custom/dir

export RIPGREP_CONFIG_PATH=~/.config/rg/ripgreprc

################################################################################
## Theme options:
################################################################################

export TMUX_FG=colour0
#export TMUX_FG=colour15

# Powerline
#export TERM_DECORATION_LEFT=''
#export TERM_DECORATION_RIGHT=''
#export TERM_DECORATION_SEPARATOR=" "
#export TMUX_DECORATION_LEFT=${TERM_DECORATION_LEFT}
#export TMUX_DECORATION_RIGHT=${TERM_DECORATION_RIGHT}

# Slightly rounded bars
export TERM_DECORATION_LEFT="퟼"
export TERM_DECORATION_RIGHT="퟽"
export TERM_DECORATION_SEPARATOR=""
export TERM_DECORATION_SEPARATOR_LEFT=" "
export TERM_DECORATION_SEPARATOR_RIGHT=" "

export TMUX_DECORATION_LEFT=${TERM_DECORATION_LEFT}
export TMUX_DECORATION_RIGHT=${TERM_DECORATION_RIGHT}
export TMUX_DECORATION_SEPARATOR_LEFT=${TERM_DECORATION_SEPARATOR}
export TMUX_DECORATION_SEPARATOR_RIGHT=${TERM_DECORATION_SEPARATOR}

# Strong rounding (lcars style)
#export TERM_DECORATION_LEFT=""
#export TERM_DECORATION_RIGHT=""
#export TERM_DECORATION_SEPARATOR=" "
#export TMUX_DECORATION_LEFT=${TERM_DECORATION_LEFT}
#export TMUX_DECORATION_RIGHT=""


################################################################################
## Local overrides:
################################################################################

test -f "$HOME/.profile_workstation" && source "$HOME/.profile_workstation"
test -f "$HOME/.profile_theme" && source "$HOME/.profile_theme"
