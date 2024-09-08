abbr p 'pikaur'
abbr syu  'pikaur -Syu'
abbr syua 'pikaur -Syua'

alias mksrcinfo 'makepkg --printsrcinfo > .SRCINFO'

abbr downgrade 'sudo downgrade --ignore never '

if status is-interactive
	function fish_command_not_found --on-event fish_command_not_found
		pkgfile $argv[1] ; or pikaur -Ss $argv[1]
	end
end
