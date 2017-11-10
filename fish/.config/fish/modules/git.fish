abbr 'gits' 'git status'
abbr 'gitd' 'git diff'
abbr 'gitdc' 'git diff --cached'
abbr 'gcm' 'git commit -m'
abbr 'gcam' 'git commit -am'

function git_status_pwd
	command git status $argv | grep -v "\.\."
end

function git_pr_to_branch
	set -l pr_number "$argv[1]"
	set -l branch_name "$argv[2]"
	if test -z $branch_name ;
		return 2
	end
	command git fetch origin pull/$pr_number/head:$branch_name
	command git checkout $branch_name
end

function git_checkout_i
	set -l branch (command git ls-files -m | fzf)
	if test ! -z "$branch"
		git checkout -- $branch
	end
end

function git_fancy_log
	#command git log --tags --decorate --graph --branches --abbrev-commit --pretty=short $argv
	function git_log_base
		command git log --date='format:%Y-%m-%d' $argv \
		| higrep "[A-Z]+-[0-9]+"
	end
	if test "$argv[1]" = '-f' ; or test "$argv[1]" = '--flat' ;
		git_log_base \
			--pretty=tformat:"%Cgreen%h %Cblue%an %Creset%s" \
			(_cdr $argv)
	else
		git_log_base \
			--graph \
			--pretty=tformat:"%Cred%D%Creset %Cgreen%h %Cblue%an %Creset%s" \
			$argv
	end
end

function git_fancy_log_dates
	function git_log_base
		command git log --color=always --date='format:%Y-%m-%d' $argv \
		| higrep "[A-Z]+-[0-9]+"
	end
	if test "$argv[1]" = '-f' ; or test "$argv[1]" = '--flat' ;
		git_log_base \
			--pretty=tformat:"%ad %Cgreen%h %Cblue%an %Creset%s" \
			(_cdr $argv)
	else
		git_log_base \
			--graph \
			--pretty=tformat:"%Cred%D%Creset %ad %Cgreen%h %Cblue%an %Creset%s" \
			$argv
	end
end
