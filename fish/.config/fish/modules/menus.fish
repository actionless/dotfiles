alias "tmux-menu" "tmux list-sessions |  tmenu -l 10l | sed -r 's/^([0-9]+):.*/\1/g' | xargs -n 1 tmux switch -t"
