function awesome-exec --description 'execute in awesome-client'
	echo "$argv" | env DISPLAY=:0.0 awesome-client
end

function awesome_music_toggle
	awesome-exec "context.widgets.music.toggle()" 
end
