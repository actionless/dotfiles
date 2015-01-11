# aliases for teh happy coding

#alias_w a_grep "ack --python --ignore-dir=env "
alias a_grep "ack --ignore-dir=env "

function a_replace -a grep_line original_value replace_value -d "replace stuff usinf ack"
	a_grep -l --print0 "$grep_line" | xargs -0 -n 1 sed -i -e 's/'"$original_value"'/'"$replace_value"'/g'
end

alias docker_rm "docker rm -f (docker ps -a -q)"
alias docker_rmi "docker rmi (docker images | grep '^<none>' | sed -r 's/[   ]+/ /g' | cut -d' ' -f3)"

### GIT
#
alias 'gcm' 'git commit -m'

#make_completion git_status_pwd "git status"
function git_status_pwd
	command git status $argv | grep -v "\.\."
end
