function sudo --description 'Wrapper for sudo'
	if test (echo $argv[1]) = 'su' 
		command sudo su --shell=/usr/bin/fish (_cdr $argv)
	else
		command sudo $argv
	end
end

function bin_time --description 'Wrapper for time'
	command time -p $FISH -c "$argv"
end

function watch --description 'Wrapper for watch'
	command watch --interval=1 -c -d "$FISH -c '$argv'"
end

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item

function _last_history_item_nth_word;
	set -f cmd (string split " " $history[1])
	set -f idx -(echo $argv[1] | string split '!')[3]
	echo $cmd[$idx]
end
abbr -a last_history_item_nth_word_abbr --position anywhere --regex "!![0-9]+" --function _last_history_item_nth_word

function forshtune
	for i in (seq (random 3 12))
		if test $i -eq 1
			echo -ne (_capitalize (_random_word))
		else
			echo -ne ' '(_random_word)
		end
	end
	echo '.'
end
