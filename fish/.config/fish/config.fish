#!/usr/sbin/fish

if [ ! -e /tmp/config-"$USER".fish ]
	echo "Writing config to tmpfs..."
	cat ~/.config/fish/modules/*.fish > /tmp/config-"$USER".fish
	set -U -x fish_prompt_left_separator $TERM_DECORATION_LEFT
	set -U -x fish_prompt_right_separator $TERM_DECORATION_RIGHT
	set -U -x fish_prompt_mid_separator $TERM_DECORATION_SEPARATOR
end

source /tmp/config-"$USER".fish
