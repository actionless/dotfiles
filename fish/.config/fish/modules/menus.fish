set -x BEMENU_BACKEND curses

function tmux-menu -d "menu: tmux: switch to session"
	tmux list-sessions \
	| bemenu \
	| sed -r 's/^([0-9]+):.*/\1/g' \
	| xargs -n 1 -I \{\} tmux switch -t \{\}
end

function tmux-menu-switch -d "menu: tmux: switch to session (and close current)"
	tmux list-sessions \
	| bemenu \
	| sed -r 's/^([0-9]+):.*/\1/g' \
	| xargs -n 1 -I \{\} tmux switch -t \{\} \; kill-session -t (tmux display-message -p "#S")
end
