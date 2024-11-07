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

function _random_word
	set -f dict /usr/share/dict/words
	cat $dict \
	| head -n (
		random 1 (
			wc -l $dict \
			| cut -d' ' -f1
		)
	) \
	| tail -n 1
end

function _capitalize
	string replace -r -a '\b([\w])' '\U$0' $argv
end
