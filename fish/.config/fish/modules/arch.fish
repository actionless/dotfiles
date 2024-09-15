abbr p 'pikaur'
abbr syu  'pikaur -Syu'
abbr syua 'pikaur -Syua'

alias mksrcinfo 'makepkg --printsrcinfo > .SRCINFO'

abbr downgrade 'sudo downgrade --ignore never '

if status is-interactive
	function fish_command_not_found --on-event fish_command_not_found
		pkgfile $argv[1] ; or begin
			echo ":: PkgFile: '$argv[1]' not found"
			read -f search_aur -P ':: search with pikaur? [y/N] > '
			string match -- "y*" "$search_aur" ; and pikaur -Ss $argv[1]
		end
	end
end
