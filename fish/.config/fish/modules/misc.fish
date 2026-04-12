function colorize -d "colorize with pygments" --wraps='highlight'
	command highlight -O ansi $argv
end
alias catc colorize

function lessc --wraps='less'
	colorize $argv | less
end

function no_color
	sed -r -e "s/[[:cntrl:]]\[[0-9][;]*{,3}[0-9]*m//g" -e "s/[[:cntrl:]]\[m//g"
end

function no_comments --description 'cat and cut comments' --wraps='cat'
	command cat $argv | grep -E -v -e "^;" -e "^#" -e "^\$" -e "^\s+#"
end

function psauxf --wraps='grep'
	ps auxf | grep -v grep | grep -C 5 -i $argv
end

function psauxf_wait --wraps='psauxf'
	#psauxf -C 0 $argv
	psauxf $argv
	read
	#and while psauxf -C 0 $argv
	and while psauxf $argv
		echo -e '\n---------------------------------------------------------------\n'
		sleep 2
	end
	and echo done
end

function psauxf_wait_endless --wraps='psauxf_wait'
	psauxf $argv
	read
	and while true
		psauxf $argv
		echo -e '\n---------------------------------------------------------------\n'
		sleep 2
	end
	and echo done
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
