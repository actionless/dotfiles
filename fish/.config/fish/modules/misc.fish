function colorize -d "colorize with pygments" --wraps='highlight'
	command highlight -O ansi $argv
end
alias catc colorize

function lessc --wraps='less'
	colorize $argv | less
end

function no_color
	sed -r "s/[[:cntrl:]]\[[0-9]{,3}m//g"
end

function no_comments --description 'cat and cut comments' --wraps='cat'
	command cat $argv | grep -E -v -e "^;" -e "^#" -e "^\$" -e "^\s+#"
end

abbr rm_temp='rm -v *~ ; rm -v *.swp ; rm -v .*~ ; rm -v .*.swp ; rm -v \#*\#'

function psauxf --wraps='grep'
	ps auxf | grep -v grep | grep -C 5 -i $argv
end

function hibernate -d 'put machine into hibernation state'
	pgrep xscreensaver ;
		or echo "xscreensaver is not running" ;
			and return 1

	command sudo echo ;
		and xscreensaver-command -lock ;
		and command sleep 2 ;
		and command sudo pm-hibernate
end

function nanodate -d 'date with nanoseconds'
	date +"%T.%3N"
end
