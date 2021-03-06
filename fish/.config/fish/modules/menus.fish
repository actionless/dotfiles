function dialog_menu
	set -l choices_file (mktemp)
	cat | sed -E 's/(.*)/\1\n/g' > $choices_file
	set -l dialog_args (cat $choices_file)
	rm $choices_file

	set -l result (dialog --menu test_dialog_title 0 0 0 $dialog_args --output-fd 1)
	echo $result
end

function my_fish_menu
	if which fzf > /dev/null
		fzf --height=10 $argv
	else if which dialog > /dev/null
		dialog_menu $argv
	else
		echo
		echo "Either `fzf` or `dialog` should be installed."
		return 1
	end
end

function tmr -d "menu: tmux: switch to session (and close current)"
	set current_session (tmux display-message -p "#S")
	tmux list-sessions \
	| begin my_fish_menu ; or return ; end \
	| sed -r 's/^(\w+):.*/\1/g' \
	| while read i; set target_session "$target_session""$i"; end
	if test ! -z "$target_session" -a  ! "$target_session" = $current_session
		tmux switch -t $target_session \; kill-session -t $current_session
	end
end
