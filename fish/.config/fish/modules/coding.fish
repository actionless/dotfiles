alias sprunge "curl -F 'sprunge=<-' http://sprunge.us"

#alias a_grep "ack --python --ignore-dir=env "
alias a_grep "ag --ignore-dir=env "

function a_replace -a grep_line original_value replace_value -d "replace stuff usinf ack"
	a_grep -l --print0 "$grep_line" \
	| xargs -0 -n 1 sed -i -e 's/'"$original_value"'/'"$replace_value"'/g'
end

###
# Docker
###

function docker_rmi
	command docker rmi (
		docker images \
		| grep '^<none>' \
		| awk '{print $3;}'
	)
end

alias docker_rm "docker rm -f (docker ps -a -q)"

function docker_size
	command echo (
		docker images \
		| grep -v SIZE \
		| awk '{print $7;}' \
		| paste -sd+ \
		| bc
	) MB
end

###
# GIT
###

alias 'gcm' 'git commit -m'

function git_status_pwd
	command git status $argv | grep -v "\.\."
end

function git_fancy_log
	command  git log --tags --oneline --decorate --graph --branches
end

function git_checkout_i
	command git ls-files -m \
	| bemenu \
	| xargs git checkout --
end
