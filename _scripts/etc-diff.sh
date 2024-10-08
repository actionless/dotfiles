#!/usr/bin/env bash

# Inspired by PACDIFF(8) from pacman-contrib

if [[ "${1:-}" = "--help" ]] ; then
	echo "$0 [--names-only|--interactive] [FILTER]"
	exit 0
fi

names_only=0
interactive=0
if [[ "${1:-}" = "--names-only" ]] ; then
	names_only=1
elif [[ "${1:-}" = "--interactive" ]] ; then
	interactive=1
fi
shift


filter=
if [[ -n "${1:-}" ]] ; then
	filter="$1"
fi
shift


DOTFILES_PATH="$HOME/dotfiles"
SYSTEM_CONFIGS_PATHS=(
	'/etc'
	'/usr'
)
DOTFILES_SUBDIR='/misc'


yellow() {
	echo "[33m$*[30m[m"
}
purple() {
	echo "[35m$*[30m[m"
}


for SYSTEM_CONFIGS_PATH in "${SYSTEM_CONFIGS_PATHS[@]}" ; do

	REFERENCE_CONFIGS_PATH="${HOME}${DOTFILES_SUBDIR}${SYSTEM_CONFIGS_PATH}"

	configs_paths=()
	while IFS= read -r -d '' reference_config_path ; do
		configs_paths+=("$reference_config_path")
	done < <(find -L "$REFERENCE_CONFIGS_PATH" -type f -print0)
	#echo "::: ${configs_paths[*]}"

	for reference_config_path in "${configs_paths[@]}" ; do
		#echo ":: $reference_config_path"
		system_config_path=${reference_config_path//$REFERENCE_CONFIGS_PATH/$SYSTEM_CONFIGS_PATH}

		dotfile_relpath=$(readlink -e "$reference_config_path" | sed -e "s|$DOTFILES_PATH/||")
		if [[ -n "$filter" ]] && ! grep "$filter" > /dev/null <<< "$dotfile_relpath" ; then
			continue
		fi

		diff -q "$reference_config_path" "$system_config_path" > /dev/null || {
			if [[ $names_only -eq 0 ]] ; then
				yellow -----------------------------------------------------------------
				echo "$(purple :: "${dotfile_relpath%%/*}")/${dotfile_relpath#*/}"
				yellow -----------------------------------------------------------------
				diff --color=always -u "$reference_config_path" "$system_config_path"
				echo
			else
				echo "$dotfile_relpath"
			fi
			if [[ "$interactive" -eq 1 ]] ; then
				echo "[u] update"
				echo "[return] skip"
				read -r answer
				if [[ "$answer" = "u" ]] ; then
					set -x
					cp "$system_config_path" "$dotfile_relpath"
					set +x
					echo "[g] git add"
					echo "[return] skip"
					read -r answer
					if [[ "$answer" = "g" ]] ; then
						set -x
						git add "$dotfile_relpath"
						set +x
					fi
				fi
			fi
		}
	done

done
