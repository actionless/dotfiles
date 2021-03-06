function ru -d 'use ru locale environment variables'
	set -l new_locale "ru_RU.utf8"
	set -l prev_locale $LC_ALL
	set -x LC_ALL $new_locale
	set -x LANG $new_locale
	set -x LANGUAGE $new_locale
	eval $argv
	set -x LC_ALL $prev_locale
	set -x LANG $prev_locale
	set -x LANGUAGE $prev_locale
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

abbr wine "env PULSE_LATENCY_MSEC=60 wine"

#alias vi nvim
#alias vim nvim

#alias tv "DISPLAY=:0.1 GTK2_RC_FILES=~/.gtkrc-2.0.tv"
#alias openbox_tv "tv openbox --config-file ~/.config/openbox/rc.xml.tv"
