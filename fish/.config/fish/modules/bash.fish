
function sudo --description 'Wrapper for sudo'
	if test (echo $argv[1]) = 'su' 
		if test (count $argv) -eq 1 
			command sudo su --shell=/usr/bin/fish
		else
			command sudo su --shell=/usr/bin/fish $argv[2..(count $argv)]
		end
	else
		command sudo $argv
	end
end

function time --description 'Wrapper for time'
	command time -p "$FISH -c '$argv'"
end

function watch --description 'Wrapper for watch'
	command watch --interval=1 -c -d "$FISH -c '$argv'"
end
