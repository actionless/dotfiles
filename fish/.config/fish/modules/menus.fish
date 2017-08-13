
function tmux-replace-b -d "menu: tmux: switch to session (and close current)"
	set current_session (tmux display-message -p "#S")
	tmux list-sessions \
	| env BEMENU_BACKEND=curses bemenu \
	| sed -r 's/^(\w+):.*/\1/g' \
	| while read i; set target_session "$target_session""$i"; end
	if test ! -z $target_session -a  ! $target_session = $current_session
		tmux switch -t $target_session \; kill-session -t $current_session
	end
end
alias tmrb tmux-replace-b

function tmux-replace-p -d "menu: tmux: switch to session (and close current)"
	set current_session (tmux display-message -p "#S")
	tmux list-sessions \
	| pmenu \
	| sed -r 's/^(\w+):.*/\1/g' \
	| while read i; set target_session "$target_session""$i"; end
	if test ! -z $target_session -a  ! $target_session = $current_session
		tmux switch -t $target_session \; kill-session -t $current_session
	end
end
alias tmrp tmux-replace-p


function tmux-replace-f -d "menu: tmux: switch to session (and close current)"
	set current_session (tmux display-message -p "#S")
	tmux list-sessions \
	| fzf --height=10 \
	| sed -r 's/^(\w+):.*/\1/g' \
	| while read i; set target_session "$target_session""$i"; end
	if test ! -z $target_session -a  ! $target_session = $current_session
		tmux switch -t $target_session \; kill-session -t $current_session
	end
end
alias tmr tmux-replace-f
