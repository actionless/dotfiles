#!/usr/bin/env bash
set -x

flush_files() {
	for file in "$@" ; do
		echo > "${file}"
	done
}

dfc | grep /home

pikaur -Scc --aur
flush_files ~/.cache/awesome_std*
rm -fr ~/aur/
rm -fr ~/btfs/
rm -fr ~/.cache/flatpak/
rm -fr ~/.cache/google-chrome/
rm -fr ~/.cache/jedi/
rm -fr ~/.cache/*.kcache
rm -fr ~/.cache/mesa/
rm -fr ~/.cache/mesa_shader_cache/
rm -fr ~/.cache/mozilla/firefox/*/cache2/
rm -fr ~/.cache/netsurf/
rm -fr ~/.cache/Otter/
rm -fr ~/.cache/parso/
rm -fr ~/.cache/pip/
rm -fr ~/.cache/qutebrowser/
rm -fr ~/.cache/thumbnails/
rm -fr ~/.cache/vimfiles/
rm -fr ~/.cache/wine/
rm -fr ~/.cache/winetricks/
rm -fr ~/.cache/winewizard/
rm -fr ~/.cargo/
rm -fr ~/.config/Clementine/spotify-cache/Storage/
rm -fr ~/.electron/
rm -fr ~/.gem/
rm -fr ~/.*-gyp/
rm -fr ~/.lazarus/
rm -fr ~/.local/share/Trash/
rm -fr ~/.local/tmp/
rm -fr ~/.log/
#rm -fr ~/.luarocks/
rm -fr ~/.npm/
rm -fr ~/.opam/
rm -fr ~/.qmc2/*cache*
rm -fr ~/.rigsofrods/cache/
rm -fr ~/.surf/cache/
rm -fr ~/.thumbnails/

dfc | grep /home
