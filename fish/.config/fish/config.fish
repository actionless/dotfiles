#!/usr/sbin/fish

if [ ! -e /tmp/config-"$USER".fish ]
	echo "Writing config to tmpfs..."
	cat ~/.config/fish/modules/*.fish > /tmp/config-"$USER".fish
	if test -n "$TERM_DECORATION_LEFT"
		set -U -x fish_prompt_left_separator $TERM_DECORATION_LEFT
	else
		set -U -x fish_prompt_left_separator ""
	end
	if test -n "$TERM_DECORATION_RIGHT"
		set -U -x fish_prompt_right_separator $TERM_DECORATION_RIGHT
	else
		set -U -x fish_prompt_right_separator ""
	end
	if test -n "$TERM_DECORATION_SEPARATOR"
		set -U -x fish_prompt_mid_separator $TERM_DECORATION_SEPARATOR
	else
		set -U -x fish_prompt_mid_separator ""
	end
	if test -n "$TERM_DECORATION_SEPARATOR_LEFT"
		set -U -x fish_prompt_mid_separator_left $TERM_DECORATION_SEPARATOR_LEFT
	else
		set -U -x fish_prompt_mid_separator_left ""
	end
	if test -n "$TERM_DECORATION_SEPARATOR_RIGHT"
		set -U -x fish_prompt_mid_separator_right $TERM_DECORATION_SEPARATOR_RIGHT
	else
		set -U -x fish_prompt_mid_separator_right ""
	end
end

source /tmp/config-"$USER".fish
