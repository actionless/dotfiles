set FISH (which fish)

#{{{ command not found
#function __fish_command_not_found_handler --on-event fish_command_not_found

	## alternative implementation:
	##cnf-lookup $argv

	#set cmd $argv[1]
	#set pkgs (pkgfile -b -v -- "$cmd" 2>/dev/null)
	#if [ (count $pkgs) -ge 1 ]
		#set_color green
		#printf '%s may be found in the following packages:\n' "$cmd"
		#set_color normal
		#for pkg in $pkgs
			#printf '	%s\n' "$pkg"
		#end
	#else
		#printf "fish: %s: command not found :(\n" "$cmd" >&2
	#end
#end
#}}}

function _cdr -d "CDR, CAR's friend"
	set -l new_argv
	if test (count $argv) -gt 1;
		set new_argv $argv[2..(count $argv)]
	end
	echo -n $new_argv
end
