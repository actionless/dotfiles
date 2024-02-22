alias rm "rm -I"
alias gr='grep --color -iER'

abbr -a ':q' exit
abbr -a v viewnior
abbr -a g gliv
abbr -a o ocenaudio
abbr -a vmi vim
abbr -a ptp ptpython
abbr -a fdn fd --no-ignore --hidden
abbr -a fdh fd --no-ignore --hidden
abbr -a fdu fd --no-ignore --hidden


function mdcd --description='mkdir and cd to'
	set -l path $argv[1]
	command mkdir -p $path
	and cd $path
end

function less --wraps='less'
	command less -r $argv
end

abbr -a dfca 'command dfc'
function dfc --wraps='dfc'
	command dfc -W -c always $argv 2>&1 \
	| grep -v -E \
		-e '^(|.+)(|dev)tmpfs' \
		-e 'docker' \
		-e 'Operation not permitted'
end

function ncdu --wraps='ncdu'
	command ncdu --color=dark $argv
end

function which --wraps='which'
	command which $argv ;
	or begin
		set -l abbr_result (abbr --show | grep " $argv[1] .*")
		if test -n "$abbr_result"
			echo -e "\nFish abbreviation:\n\n$abbr_result"
		else
			echo -e '\nFish function:\n'
			command fish -c "set EDITOR cat ; funced $argv[1]" | head -n -1
		end
	end
end


########################################
# LS crazyness:
########################################

function eza --wraps='eza'
	command eza --color=always $argv
end

#alias l 'ls --color=auto -lh'
complete -e -c l
function l --wraps='eza'
	eza $argv
end

#alias ll='ls --color=auto -lah'
complete -e -c ll
function ll --wraps='eza'
	eza -la $argv
end

function llg --wraps='eza'
	ll --git $argv
end

function lt --wraps='eza'
	ll --sort modified $argv
end

function lrt --wraps='eza'
	ll --reverse --sort modified $argv
end

abbr -a lrth "lrt | head"

# LS END
#########################################

## END ##################################
