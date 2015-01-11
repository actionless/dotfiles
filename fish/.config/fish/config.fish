#!/usr/sbin/fish

if [ ! -e /tmp/config.fish ]
	echo "Writing config to tmpfs..."
	cat ~/.config/fish/modules/*.fish > /tmp/config.fish
end

source /tmp/config.fish
