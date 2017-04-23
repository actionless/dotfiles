abbr rm_temp='rm -v *~ ; rm -v *.swp ; rm -v .*~ ; rm -v .*.swp ; rm -v \#*\#'
abbr vmi=vim

#alias ll='ls --color=auto -lah'
#alias l 'ls --color=auto -lh'
function exa --wraps='exa'
	command exa --color=always $argv
end
complete -e -c l
function l --wraps='exa'
	exa $argv
end
complete -e -c ll
function ll --wraps='exa'
	exa -la $argv
end
function llg --wraps='exa'
	ll --git $argv
end
function lrt --wraps='exa'
	ll --reverse --sort modified
end

function colorize -d "colorize with pygments" --wraps='highlight'
	command highlight -O ansi $argv
end

function less --wraps='less'
	command less -r $argv
end

function cless --wraps='less'
	colorize $argv | less
end

function no_comments --description 'cat and cut comments' --wraps='cat'
	command cat $argv | grep -E -v -e "^;" -e "^#" -e "^\$" -e "^\s+#"
end

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
