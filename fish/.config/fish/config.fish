#!/usr/sbin/fish

if [ ! -e /tmp/config-"$USER".fish ]
	echo "Writing config to tmpfs..."
	cat ~/.config/fish/modules/*.fish > /tmp/config-"$USER".fish
end

source /tmp/config-"$USER".fish
