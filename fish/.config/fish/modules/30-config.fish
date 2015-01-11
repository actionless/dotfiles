#set TERM xterm-256color
set -x EDITOR "vim"
set -x PAGER "less"
#set -x XDG_CURRENT_DESKTOP "gnome"
set -x XDG_CURRENT_DESKTOP "xfce"
# set -x fish_user_paths $fish_user_paths "~/.gem/ruby/2.1.0/bin/";
#set --universal fish_user_paths $fish_user_paths $HOME/.gem/ruby/2.1.0/bin/;
#set --universal fish_user_paths $fish_user_paths $HOME/scripts/;
eval (dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//')

function fish_user_key_bindings
	#bind \eOD backward-word
	#bind \eOC forward-word
	bind \e\P forward-word

	bind \e\[8~ end-of-line
	bind \e\[7~ beginning-of-line

	bind \e\[4~ end-of-line
	bind \e\[1~ beginning-of-line

	# st fix:
	bind \[P delete-char
end

function reload_fish
	rm /tmp/config.fish
	source ~/.config/fish/config.fish
end

set fish_color_autosuggestion 444\x1eyellow
set fish_color_command green --bold
set fish_color_comment 555
set fish_color_cwd purple
set fish_color_cwd_root red
set fish_color_error red\x1e--bold
set fish_color_escape cyan
set fish_color_history_current 333333
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator yellow
set fish_color_param cyan\x1ecyan
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match green\x1e--background=333333
set fish_color_valid_path green\x1e--underline
set fish_greeting LCARS initialized
#set fish_key_bindings fish_default_key_bindings
set fish_pager_color_completion normal
set fish_pager_color_description 888\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

#for file in ~/.config/fish/modules/*.fish
	#echo $file
#	. $file
#end
