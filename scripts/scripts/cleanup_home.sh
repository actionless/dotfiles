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

rmfiles() {
	find "$1" -type f -delete
}

# SHOW USAGE BEFORE ###########################################################
dfc | grep /home


# pkg cache: ##################################################################
######pikaur -Scc --aur --noconfirm
##rm -fr ~/aur/

# cache: ######################################################################
rm -fr ~/.cache/chromium/
rm -fr ~/.cache/debuginfod_client/
rm -fr ~/.cache/electron/
rm -fr ~/.cache/epiphany
rm -fr ~/.cache/flatpak/
rm -fr ~/.cache/go-build/
rm -fr ~/.cache/google-chrome/
rm -fr ~/.cache/jedi/
rm -fr ~/.cache/*.kcache
#rmfiles ~/.cache/mozilla/
rm -fr ~/.cache/netsurf/
rm -fr ~/.cache/ocenaudio/*.{log,crash}
rm -fr ~/.cache/Otter/
rm -fr ~/.cache/parso/
rm -fr ~/.cache/pip/
rm -fr ~/.pub-cache/
rm -fr ~/.cache/qutebrowser/
rm -fr ~/.cache/thumbnails/
rm -fr ~/.cache/vimfiles/
rm -fr ~/.cache/wine/
rm -fr ~/.cache/winetricks/
rm -fr ~/.cache/winewizard/
rm -fr ~/.cache/yarn/
rm -fr ~/.local/share/webkitgtk

# firefox:
rm -fr ~/.mozilla/firefox/"Crash Reports"
#rm -fr ~/.mozilla/firefox/*/storage/default/*/cache/

# mesa shader cache:
set +x
echo 'rm -fr ~/.cache/mesa_shader_cache/*'
rm -fr ~/.cache/mesa/
rm -fr ~/.cache/mesa_shader_cache/*
rm -fr ~/.cache/mesa_shader_cache_db/*
rm -fr ~/.cache/nvidia/GLCache/*
set -x
# more cache:
rm -fr ~/.atom/compile-cache/
rm -fr ~/.config/{Atom,Code,Headset,Notion,skypeforlinux,Slack,Soundnode}/{assetCache,Cache,"Code Cache",GPUCache,Logs,logs}/
rm -fr ~/.config/Code/{CachedData,CachedExtensions}/
rm -fr ~/.config/Clementine{,-qt5}/spotify-cache/Storage/
rm -fr ~/.config/{Slack,chromium/*,google-chrome/*,falkon/profiles/*,vivaldi/*}/"Service Worker"/{CacheStorage,ScriptCache}
rm -fr ~/.config/qupzilla/profiles/default/networkcache/
rm -fr ~/.qmc2/*cache*
rm -fr ~/.rigsofrods/cache/
rm -fr ~/.surf/cache/
# remove cache files older than 6 months: #####################################
#####find ~/.cache -type f -mtime +180 -delete;

# programming languages: ######################################################
rm -fr ~/.cache/bazel/
rm -fr ~/.cache/yarn/
rm -fr ~/.cargo/*
rm -fr ~/.rustup/*
rm -fr ~/.dub/
rm -fr ~/.electron/
rm -fr ~/.gem/
rm -fr ~/.go/* || sudo rm -fr ~/.go/*
rm -fr ~/.*-gyp/
rm -fr ~/.atom/.node-gyp
rm -fr ~/.cache/node-gyp/
rm -fr ~/.gradle/
rm -fr ~/.lazarus/
rm -fr ~/.luarocks/
rm -fr ~/.npm/
rm -fr ~/.local/share/pnpm/store
rm -fr ~/.opam/
rm -fr ~/.nuget/
rm -fr ~/.local/share/NuGet/
rm -fr ~/.cache/pre-commit
find ~ -type d -name .mypy_cache -exec rm -r {} \;
find ~ -type d -name .ruff_cache -exec rm -r {} \;
find ~/.cache -type d -name qmlcache -exec rm -r {} \;
rm -fr ~/.cache/pylint/
rm -fr ~/.cache/YAPF
rm -fr ~/.cache/black
rm -fr ~/.cache/Nuitka
rm -fr ~/.cache/pypoetry
rm -fr ~/.local/share/virtualenv

# misc: #######################################################################
flush_files ~/.cache/awesome_std*
flush_files ~/wireplumber.log
#rm -fr ~/btfs/
rm -fr ~/.local/share/Trash/
rm -fr ~/.local/tmp/
rm -fr ~/.log/
rm -fr ~/.thumbnails/

rm -fr ~/.cache/kdenlive/

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
