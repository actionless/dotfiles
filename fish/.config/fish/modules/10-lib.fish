set FISH (which fish)
#{{{ alias with completion
function make_completion2 --argument-names alias command
	echo "
		function __alias_completion_$alias
			set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
			complete -C\"$command \$cmd\"
		end
	" | .
	complete -c $alias -a "(__alias_completion_$alias)"
end

function make_completion --argument alias_name command_name
	complete -c $alias_name -xa "(
		set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
		complete -C\"$command_name \$cmd\";
	)"
end

function alias_w
	set -lx alias_name $argv[1]
	set -lx command_name $argv[2..-1]
	echo "alias $alias_name \"$command_name\"" | .
	if true then
		make_completion $alias_name (echo $command_name | sed 's/sudo //g')
	end
end
#}}}

#{{{ command not found
function __fish_command_not_found_handler --on-event fish_command_not_found

	# alternative implementation:
	#cnf-lookup $argv

	set cmd $argv[1]
	set pkgs (pkgfile -b -v -- "$cmd" 2>/dev/null)
	if [ (count $pkgs) -ge 1 ]
		set_color green
		printf '%s may be found in the following packages:\n' "$cmd"
		set_color normal
		for pkg in $pkgs
			printf '	%s\n' "$pkg"
		end
	else
		printf "fish: %s: command not found :(\n" "$cmd" >&2
	end
end
#}}}
