alias adu	'sudo apt-get update; and sudo apt-get dist-upgrade'
alias ai	'sudo apt-get install'

abbr syu 'sudo apt update; and sudo apt dist-upgrade'

function p -a cmd -d 'pikaur placeholder'
	set -l rest_argv
	if test (count $argv) -gt 1;
		set rest_argv (_cdr $argv)
	end
	argparse --name=pikaur 'u/sysupgrade' 'y/refresh' 'S/sync' 'Q/query' 'l/list' -- $argv
	if test $status -gt 0
		return $status
	end
	if test -n "$_flag_sync"
		if test -n "$_flag_refresh"
			sudo apt update
		end
		if test -n "$_flag_sysupgrade"
			sudo apt dist-upgrade
		end
		sudo apt install $rest_argv
	else if test -n "$_flag_query"
		if test -n "$_flag_list"
			sudo dpkg -L $rest_argv
		else
			echo "Query: Unknown args: $argv"
		end
	else
		echo "Unknown args: $argv"
	end
	return $status
end
