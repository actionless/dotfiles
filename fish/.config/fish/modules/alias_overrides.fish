alias rm "rm -I"
alias rg='rg -u -L'
alias gr='grep --color -iER'

abbr vmi=vim

function less --wraps='less'
	command less -r $argv
end

function tldr --wraps='tldr'
	command tldr -t base16 $argv
end


########################################
# LS crazyness:
########################################

function exa --wraps='exa'
	command exa --color=always $argv
end

#alias l 'ls --color=auto -lh'
complete -e -c l
function l --wraps='exa'
	exa $argv
end

#alias ll='ls --color=auto -lah'
complete -e -c ll
function ll --wraps='exa'
	exa -la $argv
end

function llg --wraps='exa'
	ll --git $argv
end

function lrt --wraps='exa'
	ll --reverse --sort modified $argv
end
