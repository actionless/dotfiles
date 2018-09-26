###
## MISC
####

alias sprunge "curl -F 'sprunge=<-' http://sprunge.us"

alias a_grep "rg"
function a_replace -a grep_line original_value replace_value -d "replace stuff using ag and sed"
	if test (count $argv) -eq 2;
		set replace_value $original_value
		set original_value $grep_line
	end
	a_grep -l --null "$grep_line" \
	| xargs -0 -n 1 sed -i -e 's/'"$original_value"'/'"$replace_value"'/g'
end
function rgr -a original_value replace_value -d "replace stuff using ag and sed"
	set -l rest_argv
	if test (count $argv) -gt 2;
		set rest_argv (_cdr (_cdr $argv))
	end
	rg "$original_value" -l --null $rest_argv \
	| xargs -0 -n 1 sed -i -e 's/'(echo $original_value | sed -e 's/\\\//g')'/'$replace_value'/g'
end

function higrep -d "highlight using grep"
	grep --color=always -E "$argv[1]|\$" (_cdr $argv)
end

function diff-highlight
	if which diff-highlight
		command diff-highlight $argv
	else
		/usr/share/git/diff-highlight/diff-highlight $argv
	end
end

function diffc -d "Color diff"
	command diff -u --color --color=always $argv | diff-highlight
end

###
# Python
###

alias activate "source env/bin/activate.fish"

abbr prospector "prospector -s veryhigh -w frosted -w pyroma -W vulture -W pep257 --no-autodetect -D ./"
