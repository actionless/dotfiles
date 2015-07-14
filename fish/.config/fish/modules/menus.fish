set -x BEMENU_BACKEND curses

function tmux-switch -d "menu: tmux: switch to session"
	tmux list-sessions \
	| bemenu \
	| sed -r 's/^(\w+):.*/\1/g' \
	| xargs -n 1 tmux switch -t
end
