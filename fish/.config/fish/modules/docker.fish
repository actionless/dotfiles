function docker_size
	command echo (
		docker images \
		| grep -v SIZE \
		| awk '{print $7;}' \
		| paste -sd+ \
		| bc
	) MB
end

function docker_ps
	docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"
end
