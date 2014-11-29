
alias_w 'gcm' 'git commit -m'

make_completion git_status_pwd "git status"
function git_status_pwd
	command git status $argv | grep -v "\.\."
end
