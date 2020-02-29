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
