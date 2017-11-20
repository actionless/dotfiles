###
## MISC
####

alias sprunge "curl -F 'sprunge=<-' http://sprunge.us"

alias a_grep "rg --hidden"

function a_replace -a grep_line original_value replace_value -d "replace stuff using ag and sed"
	if test (count $argv) -eq 2;
		set replace_value $original_value
		set original_value $grep_line
	end
	a_grep -l --null "$grep_line" \
	| xargs -0 -n 1 sed -i -e 's/'"$original_value"'/'"$replace_value"'/g'
end

function higrep -d "highlight using grep"
	grep --color=always -E "$argv[1]|\$" (_cdr $argv)
end

###
# Python
###

alias activate "source env/bin/activate.fish"

abbr prospector "prospector -s veryhigh -w frosted -w pyroma -W vulture -W pep257 --no-autodetect -D ./"
