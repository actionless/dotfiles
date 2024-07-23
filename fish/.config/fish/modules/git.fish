abbr 'gits' 'git status'
abbr 'gitd' 'git diff'
abbr 'gitdc' 'git diff --cached'
abbr 'gcm' 'git commit -m'
abbr 'gcam' 'git commit -am'
abbr 'gps' 'git push origin'
abbr 'gpsh' 'git push origin HEAD'
abbr 'gpsm' 'git push origin master'
abbr 'gpl' 'git pull origin'
abbr 'gplm' 'git pull origin master'

function git_status_pwd
	command git status $argv | grep -v "\.\."
end

function git_pr_to_branch
	set -f pr_number "$argv[1]"
	set -f branch_name "$argv[2]"
	if test -z $branch_name ;
		return 2
	end
	command git fetch origin pull/$pr_number/head:$branch_name
	command git checkout $branch_name
end

function git_checkout_menu
	set -f file (command git ls-files -m | my_fish_menu)
	if test ! -z "$file"
		git checkout -- $file
	end
end

function git_add_menu
	set -f file (command git ls-files -m | my_fish_menu)
	if test ! -z "$file"
		git add -- $file
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
