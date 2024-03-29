set FISH (which fish)

#set TERM xterm-256color
set -x EDITOR "vim"
set -x PAGER "less"
#set -x XDG_CURRENT_DESKTOP "gnome"
set -x XDG_CURRENT_DESKTOP "xfce"
set -x LC_ALL "en_US.UTF-8"
# set -x fish_user_paths $fish_user_paths "~/.gem/ruby/2.1.0/bin/";
#set --universal fish_user_paths $fish_user_paths $HOME/.gem/ruby/2.1.0/bin/;
#set --universal fish_user_paths $fish_user_paths $HOME/scripts/;
#eval (dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//')
if test -d $HOME/.cargo/bin
	set --universal fish_user_paths $fish_user_paths $HOME/.cargo/bin
end
if test -d /usr/local/Cellar/coreutils ; and test -d /usr/local/Cellar/coreutils/*/bin
	set --universal fish_user_paths /usr/local/Cellar/coreutils/*/bin $fish_user_paths
end
if command which dircolors > /dev/null
	dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//' | source
end

if ! echo $PATH | grep -q $HOME
	set PATH $HOME/bin $PATH
end
if test -z "$DISPLAY"
	set -x DISPLAY ":0"
end
if test -z "$DBUS_SESSION_BUS_ADDRESS"
	set -x DBUS_SESSION_BUS_ADDRESS "unix:path=/run/user/"(id -u)"/bus"
end
if test -z "$XAUTHORITY"
	set -x XAUTHORITY "$HOME/.Xauthority"
end


# clean the line on ctrl+c instead of jumping the prompt
bind \cc 'commandline ""'

 # st fix:
bind \[P delete-char


function reload_fish
	#set -g fish_user_abbreviations
	for a in (abbr -l); abbr -e $a; end

	rm /tmp/config-"$USER".fish
	source ~/.config/fish/config.fish
end

if status is-interactive
	set fish_greeting LCARS initialized
end

#set fish_color_autosuggestion 444\x1eyellow
#set fish_color_autosuggestion 666\x1eyellow
#set fish_color_autosuggestion 666 yellow
#set fish_color_autosuggestion brwhite yellow
set fish_color_autosuggestion blue yellow
#set fish_color_autosuggestion brblue yellow
set fish_color_command green --bold
set fish_color_comment 555
set fish_color_cwd purple
set fish_color_cwd_root red
set fish_color_error red --bold
set fish_color_escape cyan
set fish_color_history_current 333333
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator yellow
set fish_color_param cyan cyan
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_valid_path green --underline
#set -U fish_pager_color_completion normal
set -U fish_pager_color_completion white
set fish_color_search_match green --background=brblack
set -U fish_pager_color_description 888 yellow
set -U fish_pager_color_prefix cyan
set -U fish_pager_color_progress cyan
