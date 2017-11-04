###
## MISC
####

alias sprunge "curl -F 'sprunge=<-' http://sprunge.us"

#abbr a_grep "ack --python --ignore-dir=env "
alias a_grep "ag --ignore-dir=env "

function a_replace -a grep_line original_value replace_value -d "replace stuff using ag and sed"
	a_grep -l --print0 "$grep_line" \
	| xargs -0 -n 1 sed -i -e 's/'"$original_value"'/'"$replace_value"'/g'
end

function higrep -d "highlight using grep"
	grep --color=always -E "$argv[1]|\$" (_cdr $argv)
end

###
# Python
###

alias activate "source env/bin/activate.fish"

abbr prospector "prospector -s veryhigh -w frosted -w pyroma -W vulture -W pep257 --no-autodetect -D ./"

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

abbr docker_rm "docker rm -v (docker ps -a -q)"

abbr docker_rm_all "docker_rmi; docker_rm; docker_rmi"

function docker_size
	command echo (
		docker images \
		| grep -v SIZE \
		| awk '{print $7;}' \
		| paste -sd+ \
		| bc
	) MB
end


alias docker_ps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
