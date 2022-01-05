function rg --wraps='grep'
	if test (count $argv) -eq 1
		grep -R $argv *
	else
		grep -R $argv
	end
	return $status
end

########################################
# LS crazyness:
########################################

function l --wraps='ls'
	ls $argv
end

function ll --wraps='ls'
	ls -la $argv
end

function llg --wraps='ls'
	echo "llg: Not implemented for brewless mac setup, sorry :("
	return 2
end

function lt --wraps='ls'
	ll -tr $argv
end

function lrt --wraps='ls'
	ll -t $argv
end

abbr -a lrth "lrt | head"

# LS END
#########################################
