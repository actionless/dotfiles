function _fish_git_prompt
	set git_branch_name (
		command git symbolic-ref HEAD 2>/dev/null \
		| sed -e 's|^refs/heads/||'
	)
	if [ -z $git_branch_name ]
		return 1
	else
		set -l git_status (
			command git status --porcelain --ignore-submodules=dirty 2>/dev/null \
			| string collect
		)
		if [ -n "$git_status" ]
			set_color red -o
			set git_branch_name_uncommited (echo $git_status | grep "^ [MD]" | wc -l | tr -d '[:space:]')
			set git_branch_name_unstaged (echo $git_status | grep "^??" | wc -l | tr -d '[:space:]')
			set git_branch_addition " ($git_branch_name_uncommited/$git_branch_name_unstaged)"
		end

		set git_ahead_count (
			command git log origin/$git_branch_name..HEAD 2>/dev/null \
			| grep '^commit' \
			| wc -l | tr -d '[:space:]'
		)
		if [ $git_ahead_count -gt 0 ]
			set_color green -o
		end

	end
	echo " ""$git_branch_name""$git_branch_addition"" "
end



#set -x fish_prompt_left_separator ""
#set -x fish_prompt_right_separator ""
#set -x fish_prompt_mid_separator " "
#set -x fish_prompt_left_separator "퟼"
#set -x fish_prompt_right_separator "퟽"
#set -x fish_prompt_left_separator $TERM_DECORATION_LEFT
#set -x fish_prompt_right_separator $TERM_DECORATION_RIGHT
#set -x fish_prompt_mid_separator $TERM_DECORATION_SEPARATOR


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

	if test -z $SSH_TTY
		# hide hostname
		set -e __fish_prompt_hostname
	else
		if not set -q __fish_prompt_hostname
			set -g __fish_prompt_hostname "@"(hostname|cut -d . -f 1)
		end
		set fish_color_cwd cyan
		set user_color green
	end

	set -l inverse "\e[7m"

	if [ $last_status -ne 0 ]
		set prompt_status (set_color yellow -o) $inverse " ""$last_status"" " (set_color -b normal) $fish_prompt_mid_separator
	end

	echo -e -n -s \
"\n " \
(set_color $fish_color_cwd) $fish_prompt_left_separator \
(set_color -b $fish_color_cwd) $fish_prompt_mid_separator_left \
(set_color -b normal) $fish_prompt_mid_separator \
$inverse (set_color $user_color) " "$USER \
$__fish_prompt_hostname " " \
(set_color -b normal) $fish_prompt_mid_separator \
$inverse (set_color $fish_color_cwd) " "(pwd -P)" " \
(set_color -b normal) $fish_prompt_mid_separator \
$inverse (set_color $fish_color_cwd -o) (_fish_git_prompt ; and echo (set_color -b normal)$fish_prompt_mid_separator) \
$prompt_status \
(set_color -b $fish_color_cwd normal) $fish_prompt_mid_separator_right \
(set_color -b normal $fish_color_cwd) $fish_prompt_right_separator " " \
(set_color -b normal) \
$__fish_prompt_normal "\n" \
$user_prompt " "

end
