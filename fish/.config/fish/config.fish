if [ ! -e /tmp/fish_config ]
	echo "Writing config to tmpfs"
	cat ~/.config/fish/modules/*.fish > /tmp/fish_config
end

. /tmp/fish_config
