set FISH (which fish)

function _cdr -d "CDR, CAR's friend"
	set -l new_argv
	if test (count $argv) -gt 1;
		set new_argv $argv[2..(count $argv)]
	end
	for arg in $new_argv
		echo $arg
	end
end
