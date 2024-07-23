function _cdr -d "CDR, CAR's friend"
	set -f new_argv
	if test (count $argv) -gt 1;
		set -f new_argv $argv[2..(count $argv)]
	end
	for arg in $new_argv
		echo $arg
	end
end
