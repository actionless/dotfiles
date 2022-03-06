###
## MISC
####

function sprunge
	command curl -F 'sprunge=<-' http://sprunge.us $argv
end

function sprunge_file
	cat $argv | sprunge
end

function rgr -a original_value replace_value -d "replace stuff using rg and sed"
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
	if which diff-highlight > /dev/null
		command diff-highlight $argv
	else
		/usr/share/git/diff-highlight/diff-highlight $argv
	end
end

function diffc -d "Color diff"
	command diff -u --color --color=always $argv | diff-highlight
end


function co -d "Print specific column numbers"
	set -l argn (count $argv)
	set -l cmd "{ print "
	for i in (seq $argn)
		set cmd "$cmd \$$argv[$i]"
		if test $i -ne $argn ;
			set cmd "$cmd \" \""
		end
	end
	set -l cmd "$cmd };"
	command awk $cmd
end

function line -d "Print specific line numbers"
	set -l argn (count $argv)
	set -l cmd "{ if("
	for i in (seq $argn)
		set cmd $cmd"NR==$argv[$i]"
		if test $i -ne $argn ;
			set cmd "$cmd || "
		end
	end
	set -l cmd "$cmd) print \$0; };"
	command awk $cmd
end


###
# Python
###

function activate
	source env/bin/activate.fish
end

function poetry_shell
	set -l project_name (basename $PWD | sed 's/_/-/g')
	set -l python_version (python --version | grep -o '[0-9].[0-9]')
	source $HOME/.cache/pypoetry/virtualenvs/$project_name-py$python_version/bin/activate.fish
end
