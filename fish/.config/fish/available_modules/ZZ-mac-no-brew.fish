test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish ; or true
#set --universal fish_user_paths /Library/Developer/CommandLineTools/usr/bin $fish_user_paths


alias rm "command rm"

function rg --wraps='grep'
	if test (count $argv) -eq 1
		grep -R $argv *
	else
		grep -R $argv
	end
	return $status
end

function fd --wraps='find'
	if test (count $argv) -eq 1
		find . -name $argv
	else
		find $argv
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
	ls -h -la $argv
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
