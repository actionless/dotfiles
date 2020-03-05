#!/usr/bin/env bash
set -x

flush_files() {
	for file in "$@" ; do
		echo > "${file}"
	done
}

move_cache_dir() {
	dir_path="$1"
	cache_name="$2"
	if [[ -d "$1" ]] ; then
		cache_path="/media/ext/cache/${cache_name}"
		mv "$dir_path" "$cache_path"
		ln -s "$cache_path" "$dir_path"
	fi
}

# SHOW USAGE BEFORE ###########################################################
dfc | grep /home


# pkg cache: ##################################################################
pikaur -Scc --aur
##rm -fr ~/aur/

# cache: ######################################################################
rm -fr ~/.cache/chromium/
rm -fr ~/.cache/electron/
rm -fr ~/.cache/flatpak/
rm -fr ~/.cache/google-chrome/
rm -fr ~/.cache/jedi/
rm -fr ~/.cache/*.kcache
rm -fr ~/.cache/mesa/
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
rm -fr ~/.cache/yarn/
rm -fr ~/.mozilla/firefox/"Crash Reports"
# mesa shader cache:
set +x
echo 'rm -fr ~/.cache/mesa_shader_cache/*'
rm -fr ~/.cache/mesa_shader_cache/*
set -x
# more cache:
rm -fr ~/.atom/compile-cache/
rm -fr ~/.config/{Atom,Headset,Notion,Slack,Soundnode}/{assetCache,Cache,GPUCache,Logs}/
rm -fr ~/.config/Clementine{,-qt5}/spotify-cache/Storage/
rm -fr ~/.config/Code/{Cache,CachedData,CachedExtensions,logs}/
rm -fr ~/.config/{Slack,chromium/*,google-chrome/*,falkon/profiles/*,vivaldi/*}/"Service Worker"/{CacheStorage,ScriptCache}
rm -fr ~/.config/qupzilla/profiles/default/networkcache/
rm -fr ~/.qmc2/*cache*
rm -fr ~/.rigsofrods/cache/
rm -fr ~/.surf/cache/
# remove cache files older than 6 months: #####################################
find ~/.cache -type f -mtime +180 -delete;

# programming languages: ######################################################
rm -fr ~/.cache/yarn/
rm -fr ~/.cargo/
rm -fr ~/.dub/
rm -fr ~/.electron/
rm -fr ~/.gem/
rm -fr ~/.go/* || sudo rm -fr ~/.go/*
rm -fr ~/.*-gyp/
rm -fr ~/.lazarus/
rm -fr ~/.luarocks/
rm -fr ~/.npm/
rm -fr ~/.opam/
#find ~ -type d -name .mypy_cache -exec rm -r {} \;

# misc: #######################################################################
flush_files ~/.cache/awesome_std*
rm -fr ~/btfs/
rm -fr ~/.local/share/Trash/
rm -fr ~/.local/tmp/
rm -fr ~/.log/
rm -fr ~/.thumbnails/

# spotify: ####################################################################
#move_cache_dir ~/.cache/spotify spotify
#pkill spotify
#sleep 1
#rm -fr ~/.cache/spotify/Data/
#(
	#sleep 1
	#spotify >/dev/null 2>&1 &
	#disown -a
	#sleep 3
	#fish -c 'awesome_music_toggle'
#) &

# SHOW USAGE AFTER ############################################################
set +x
echo
echo
echo
dfc | grep /home
echo
echo '$$ CLEAN-UP HOME DONE $$'
echo
exit 0
