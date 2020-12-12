#!/usr/bin/env bash

# Inspired by PACDIFF(8) from pacman-contrib


DOTFILES_PATH="$HOME/dotfiles"
REFERENCE_CONFIGS_PATH="$HOME/misc/etc"
SYSTEM_CONFIGS_PATH='/etc'


yellow() {
	echo "[33m$*[30m[m"
}
purple() {
	echo "[35m$*[30m[m"
}


while IFS= read -r -d '' path ; do
	system_path=${path//$REFERENCE_CONFIGS_PATH/$SYSTEM_CONFIGS_PATH}

	diff -q "$path" "$system_path" > /dev/null || (
		dotfile_relpath=$(readlink -e "$path" | sed -e "s|$DOTFILES_PATH/||")
		dotfile_subdir="$(sed -E 's|([^/]*)/.*|\1|g' <<< "$dotfile_relpath")"
		yellow -----------------------------------------------------------------
		echo "$(purple :: "$dotfile_subdir")${dotfile_relpath//$dotfile_subdir/}"
		yellow -----------------------------------------------------------------

		diff --color=always -u "$path" "$system_path"

		echo
	)
done < <(find -L "$REFERENCE_CONFIGS_PATH" -type f -print0)
