#alias ai	'sudo apt-get install'
#make_completion	ai 'apt-get install'


alias_w sc 'sudo systemctl'
alias_w y 'yaourt'

function crnt_net --description 'shows current network connection name'
	set IF_ETHER "enp0s25"
	set IF_WLAN "wlp12s0"
	#set current_interface (ip addr | sed -r "/^[0-9]: ([a-z0-9]+):.*state UP.*/!d;s//\1/g")
	set current_interface (cat /proc/net/bonding/bond0 | sed -r "/Currently Active Slave: (.*)/!d;s//\1/g")
	echo $current_interface
	switch $current_interface
	case $IF_ETHER
		echo "ethernet"
	case $IF_WLAN
		sudo netctl-auto current
	case "enp0s29f7u2"
		echo "vodafone"
	case "*"
		echo "-"
	end
end
