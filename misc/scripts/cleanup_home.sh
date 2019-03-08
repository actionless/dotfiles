#!/usr/bin/env bash
set -x

flush_files() {
	for file in "$@" ; do
		echo > "${file}"
	done
}

# SHOW USAGE BEFORE ###########################################################
dfc | grep /home


# pkg cache: ##################################################################
pikaur -Scc --aur
#rm -fr ~/aur/

# cache: ######################################################################
rm -fr ~/.cache/electron/
rm -fr ~/.cache/flatpak/
rm -fr ~/.cache/google-chrome/
rm -fr ~/.cache/jedi/
rm -fr ~/.cache/*.kcache
rm -fr ~/.cache/mesa/
rm -fr ~/.cache/mesa_shader_cache/*
rm -fr ~/.cache/mozilla/firefox/*/cache2/
rm -fr ~/.cache/netsurf/
rm -fr ~/.cache/Otter/
rm -fr ~/.cache/parso/
rm -fr ~/.cache/pip/
rm -fr ~/.cache/qutebrowser/
rm -fr ~/.cache/spotify/Data/
rm -fr ~/.cache/thumbnails/
rm -fr ~/.cache/vimfiles/
rm -fr ~/.cache/wine/
rm -fr ~/.cache/winetricks/
rm -fr ~/.cache/winewizard/
rm -fr ~/.cache/yarn/
# more cache:
rm -fr ~/.config/Clementine/spotify-cache/Storage/
rm -fr ~/.rigsofrods/cache/
rm -fr ~/.surf/cache/
rm -fr ~/.qmc2/*cache*

# programming languages: ######################################################
rm -fr ~/.cargo/
rm -fr ~/.dub/
rm -fr ~/.electron/
rm -fr ~/.gem/
rm -fr ~/.*-gyp/
rm -fr ~/.lazarus/
rm -fr ~/.luarocks/
rm -fr ~/.npm/
rm -fr ~/.opam/
find ./ -type d -name .mypy_cache -exec rm -r {} \;

# misc: #######################################################################
flush_files ~/.cache/awesome_std*
rm -fr ~/btfs/
rm -fr ~/.local/share/Trash/
rm -fr ~/.local/tmp/
rm -fr ~/.log/
rm -fr ~/.thumbnails/


# SHOW USAGE AFTER ############################################################
dfc | grep /home

exit 0
