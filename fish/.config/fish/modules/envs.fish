function ru -d 'use ru locale variable'
	set prev_locale $LC_ALL
	set -x LC_ALL "ru_RU.utf8"
	eval $argv
	set -x LC_ALL $prev_locale
end

function alt_gtk -d "run app with fallback GTK theme"
	set -lx GTK2_RC_FILES ~/.gtkrc-2.0.browsers
	eval $argv
end

function man -d "colored man"
	env \
		LESS_TERMCAP_mb=(printf "\e[1;31m") \
		LESS_TERMCAP_md=(printf "\e[1;31m") \
		LESS_TERMCAP_me=(printf "\e[0m") \
		LESS_TERMCAP_se=(printf "\e[0m") \
		LESS_TERMCAP_so=(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=(printf "\e[0m") \
		LESS_TERMCAP_us=(printf "\e[1;32m") \
		man $argv
end

function wine64 -d "x64 wine workspace"
	env \
		WINEARCH=win64 \
		WINEPREFIX=~.wine64 \
		man $argv
end

#alias tv "DISPLAY=:0.1 GTK2_RC_FILES=~/.gtkrc-2.0.tv"
#alias openbox_tv "tv openbox --config-file ~/.config/openbox/rc.xml.tv"
#alias tv_sudo "sudo DISPLAY=:0.1 GTK2_RC_FILES=/home/lie/.gtkrc-2.0.tv
