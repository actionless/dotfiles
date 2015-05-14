set -x BEMENU_BACKEND curses

function tmux-switch -d "menu: tmux: switch to session"
	tmux list-sessions \
	| bemenu \
	| sed -r 's/^(\w+):.*/\1/g' \
	| xargs -n 1 tmux switch -t
end

function tmux-replace -d "menu: tmux: switch to session (and close current)"
	set current_session (tmux display-message -p "#S")
	tmux list-sessions \
	| bemenu \
	| sed -r 's/^(\w+):.*/\1/g' \
	| while read i; set target_session "$target_session""$i"; end
	if test ! -z $target_session -a  ! $target_session = $current_session
		tmux switch -t $target_session \; kill-session -t $current_session
	end
end
