function docker_rmi
	command docker images | awk '/<none>/ {print $3}' | xargs docker image rm
end

function docker_rm
	command docker ps -a | awk '/Exited/ {print $1}' | xargs docker rm -v
end

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
