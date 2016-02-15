function _get_git_branch_name
	echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
	echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _get_git_ahead_count -a branch_name
	echo (command git log origin/$branch_name..HEAD ^/dev/null | \
	grep '^commit' | wc -l | tr -d ' ')
end

function git_prompt
	#if not set -q -g __fish_classic_git_functions_defined
		#set -g __fish_classic_git_functions_defined
	#end
	#__fish_git_prompt
	set git_branch_name (_get_git_branch_name)
	if [ $git_branch_name ]
		if [ (_is_git_dirty) ]
			set_color red -o
			set git_branch_name_uncommited (git status --porcelain 2>/dev/null| grep "^ [MD]" | wc -l)
			set git_branch_name_unstaged (git status --porcelain 2>/dev/null| grep "^??" | wc -l)
			set git_branch_addition " ($git_branch_name_uncommited/$git_branch_name_unstaged)"
		else
			if [ (_get_git_ahead_count $git_branch_name) -gt 0 ]
				set_color green -o
			end
		end
	else
		return 1
	end
	echo " ""$git_branch_name""$git_branch_addition"" "
end

function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	switch $USER
	case root
		set user_color red
		set user_prompt '#'
	case '*'
		set user_color blue
		set user_prompt '$'
	end

	# hide hostname
	#if not set -q __fish_prompt_hostname
		#set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	#end
	set -e __fish_prompt_hostname

	set -l inverse "\e[7m"

	if [ $last_status -ne 0 ]
		set prompt_status (set_color yellow -o) $inverse " ""$last_status"" " (set_color -b normal) $fish_prompt_mid_separator
	end

	#set -x fish_prompt_left_separator ""
	#set -x fish_prompt_right_separator ""
	#set -x fish_prompt_mid_separator " "

	set -x fish_prompt_left_separator "퟼"
	set -x fish_prompt_right_separator "퟽"
	set -x fish_prompt_mid_separator ""

	echo -e -n -s \
"\n " \
(set_color $fish_color_cwd) $fish_prompt_left_separator \
(set_color -b normal) $fish_prompt_mid_separator \
$inverse (set_color $user_color) " "$USER " " $__fish_prompt_hostname" " \
(set_color -b normal) $fish_prompt_mid_separator \
$inverse (set_color $fish_color_cwd) " "(pwd)" " \
(set_color -b normal) $fish_prompt_mid_separator \
$inverse (set_color $fish_color_cwd -o) (git_prompt ; and echo (set_color -b normal)$fish_prompt_mid_separator) \
$prompt_status \
(set_color -b normal $fish_color_cwd) $fish_prompt_right_separator " " \
(set_color -b normal) \
$__fish_prompt_normal "\n" \
$user_prompt " "

end
