function awesome-exec --description 'execute in awesome-client'
	env DISPLAY=:0.0 awesome-client $argv
end

function awesome_music_toggle
	awesome-exec "CONFIG_CONTEXT.widgets.music.toggle()"
end


function awesome_music_next
	awesome-exec "CONFIG_CONTEXT.widgets.music.next_song()"
end

function awesome_music_prev
	awesome-exec "CONFIG_CONTEXT.widgets.music.prev_song()"
end

function awesome-restart
	xrdb -merge ~/.Xresources ;
	and awesome-exec "awesome.restart()"
end
