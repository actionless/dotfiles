abbr p 'pikaur'
abbr syu  'pikaur -Syu'
abbr syua 'pikaur -Syua'

alias mksrcinfo 'makepkg --printsrcinfo > .SRCINFO'

abbr downgrade 'sudo downgrade --ignore never '

if status is-interactive
	set -g __ignore_notfound_cmds '[1' '2A' '2A[1' '5A' '5B'

	function fish_command_not_found --on-event fish_command_not_found
		set -f cmd $argv[1]
		if contains $cmd $__ignore_notfound_cmds
			forshtune | pikasay --orientation vertical
			return 1
		end
		pkgfile "$cmd" ; or begin
			echo ":: PkgFile: '$argv[1]' not found"
			read -f search_aur -P ':: search with pikaur? [y/N] > '
			string match -- "y*" "$search_aur" ; and pikaur -Ss $argv[1]
		end
	end
end
