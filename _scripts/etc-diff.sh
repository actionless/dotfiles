#!/usr/bin/env bash

# Inspired by PACDIFF(8) from pacman-contrib

names_only=0
if [[ "${1:-}" = "--names-only" ]] ; then
	names_only=1
fi

DOTFILES_PATH="$HOME/dotfiles"
REFERENCE_CONFIGS_PATH="$HOME/misc/etc"
SYSTEM_CONFIGS_PATH='/etc'


yellow() {
	echo "[33m$*[30m[m"
}
purple() {
	echo "[35m$*[30m[m"
}


while IFS= read -r -d '' reference_config_path ; do
	system_config_path=${reference_config_path//$REFERENCE_CONFIGS_PATH/$SYSTEM_CONFIGS_PATH}

	diff -q "$reference_config_path" "$system_config_path" > /dev/null || (
		dotfile_relpath=$(readlink -e "$reference_config_path" | sed -e "s|$DOTFILES_PATH/||")
		if [[ $names_only -eq 0 ]] ; then
			yellow -----------------------------------------------------------------
			echo "$(purple :: "${dotfile_relpath%%/*}")/${dotfile_relpath#*/}"
			yellow -----------------------------------------------------------------
			diff --color=always -u "$reference_config_path" "$system_config_path"
			echo
		else
			echo "$dotfile_relpath"
		fi
	)
done < <(find -L "$REFERENCE_CONFIGS_PATH" -type f -print0)
