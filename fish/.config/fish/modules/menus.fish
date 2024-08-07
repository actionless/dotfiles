function dialog_menu -d "fallback menu implementation based on `dialog` in case if `fzf is not installed"
	set -f choices_file (mktemp)
	cat | sed -E 's/(.*)/\1\n/g' > $choices_file
	set -f dialog_args (cat $choices_file)
	rm $choices_file

	set -f result (dialog --menu test_dialog_title 0 0 0 $dialog_args --output-fd 1)
	echo $result
end

function my_fish_menu -d "wrapper for a menu: use `fzf` or `dialog`-based one"
	if command which fzf > /dev/null
		fzf --height=10 $argv
	else if command which dialog > /dev/null
		dialog_menu $argv
	else
		echo
		echo "Either `fzf` or `dialog` should be installed."
		return 1
	end
end

function tmr -d "menu: tmux: switch to session (and close current)"
	set -f current_session (tmux display-message -p "#S")
	tmux list-sessions \
	| begin my_fish_menu ; or return ; end \
	| sed -r 's/^(\w+):.*/\1/g' \
	| while read i; set -f target_session "$target_session""$i"; end
	if test ! -z "$target_session" -a  ! "$target_session" = $current_session
		tmux switch -t $target_session \; kill-session -t $current_session
	end
end


function bluetooth_connect_menu -d "menu: connect to paired bluetooth device"
	set -f device (bluetoothctl devices | my_fish_menu | cut -d' ' -f2)
	if test ! -z "$device"
		bluetoothctl connect $device
	end
end
