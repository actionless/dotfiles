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
function lrt --wraps='exa'
	ll --reverse --sort modified
end

function colorize -d "colorize with pygments"
	if [ (echo $argv | wc -w) -eq 0 ]
		pygmentize -g $argv
	end
	for FNAME in $argv
		set -lx filename (basename $FNAME)
		set -lx lexer (pygmentize -N $filename)
		if [ "Z$lexer" != "Ztext" ]
			pygmentize -l $lexer "$FNAME"
		else
			pygmentize -g "$FNAME"
		end
	end
end

function less
	command less -r $argv
end

function cless
	colorize $argv | less
end

function no_comments --description 'cat and cut comments'
	command cat $argv | grep -E -v -e "^;" -e "^#" -e "^\$" -e "^\s+#"
end
