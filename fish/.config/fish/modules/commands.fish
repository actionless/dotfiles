alias rm_temp='rm -v *~ ; rm -v *.swp ; rm -v .*~ ; rm -v .*.swp ; rm -v \#*\#'
alias ll='ls -lah --color=auto'
alias_w l 'ls -lh --color=auto'

make_completion git_status_pwd "git status"
function git_status_pwd
	command git status $argv | grep -v "\.\."
end


function no_comments --description 'cat and cut comments'
	command cat $argv | grep -v -e "^;" -e "^#" -e "^\$" -e "^[ \t]\+#"
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


function cless
	colorize $argv | less -r
end
