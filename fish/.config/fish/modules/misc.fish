
#abbr_w tiv "tiv -jb  -c -r 0.5"

abbr rm_temp='rm -v *~ ; rm -v *.swp ; rm -v .*~ ; rm -v .*.swp ; rm -v \#*\#'
alias ll='ls --color=auto -lah'
alias l 'ls --color=auto -lh'

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

function cless
	colorize $argv | less -r
end

function no_comments --description 'cat and cut comments'
	command cat $argv | grep -v -e "^;" -e "^#" -e "^\$" -e "^[ \t]\+#"
end

function awesome-exec --description 'execute in awesome-client'
	echo "$argv" | awesome-client
end
