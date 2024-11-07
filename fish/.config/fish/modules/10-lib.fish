function _car
	if test (count $argv) -gt 1;
		for arg in $argv[1..(math (count $argv) - 1)]
			echo $arg
		end
	end
end


function _cdr -d "CDR, CAR's friend"
	if test (count $argv) -gt 1;
		for arg in $argv[2..(count $argv)]
			echo $arg
		end
	end
end
