alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias grep='nocorrect grep'
alias yaourt='nocorrect yaourt'

alias grep='grep --color'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias l='ls -lh'

alias dist_upgrade='sudo aptitude update && sudo aptitude dist-upgrade'
alias rm_temp='rm -v *~ ; rm -v *.swp ; rm -v .*~ ; rm -v .*.swp'
alias mount_usb='sudo mount -t vfat -o rw,nosuid,uid=1000,utf8'

alias sublime='/opt/sublime_text/sublime_text'
alias mplayer_deint='mplayer -vf yadif=1'
alias mpv_deint='mpv -vf yadif=1'
alias wine64='WINEARCH=win64 WINEPREFIX=/home/lie/.wine64 wine'

#Environments:
alias alt_gtk='GTK2_RC_FILES=~/.gtkrc-2.0.browsers'
alias ru='LC_ALL=ru_RU.utf8'
alias tv="DISPLAY=:0.1 GTK2_RC_FILES=~/.gtkrc-2.0.tv"
alias openbox_tv="tv openbox --config-file ~/.config/openbox/rc.xml.tv"
alias tv_sudo="sudo DISPLAY=:0.1 GTK2_RC_FILES=/home/lie/.gtkrc-2.0.tv"

#DEB stuff:
alias ai='sudo apt-get install'

#Power management:
alias u_suspend='dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend'
alias u_hibernate='dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate'
alias u_shutdown='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'
alias u_reboot='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart'

#Compositing:
alias comp_video='killall compton; compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc --glx-no-rebind-pixmap --config ~/.config/compton_awesome.conf &'
alias comp_normal='killall compton; compton --vsync opengl --dbe --config ~/.config/compton_awesome.conf &'
alias comp_restart='killall compton; compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc --unredir-if-possible --config ~/.config/compton_awesome.conf &'

function cless(){
	colorize $1 | less
}

