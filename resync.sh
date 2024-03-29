#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

blue() {
	echo "[34m$*[30m[m"
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME_NAME="${2-}"
if [[ -z ${THEME_NAME} ]] ; then
	THEME_NAME=$("$SCRIPT_DIR"/current-theme.sh)
fi
THEME_DIR=$SCRIPT_DIR/$THEME_NAME

PC_NAME="${1-}"
if [ -z "$PC_NAME" ] ; then
	PC_NAME=$("$SCRIPT_DIR"/current-workstation.sh)
fi
PC_NAME=$(basename "$PC_NAME")

migrate_symlink_paths() {
	for path in "${SYM_PATHS[@]}" ; do
		if [[ -f ~/"$path" && ! -L ~/"$path" ]] ; then
			mv ~/"$path" "$SYM_PATH_DEST"/"$path" || true
		fi
	done
}

SYM_PATHS=(
	'.gtkrc-2.0'
	'.config/gtk-3.0/settings.ini'
)
SYM_PATH_DEST="$THEME_DIR"
migrate_symlink_paths
SYM_PATHS=(
	'.config/user-dirs.dirs'
)
SYM_PATH_DEST="env"
migrate_symlink_paths


if which pacman > /dev/null ; then
	pacman -Qqe | grep -v -f <(\
		grep '^IgnorePkg' /etc/pacman.conf \
		| cut --delimiter='=' -f2 \
		| sed 's/ /\n/g' \
		| grep -v -e '^$' -e actionless -e federation \
	) > "$PC_NAME/misc/pacman_Qqe.txt"
fi
# shellcheck disable=SC2024
if which systemctl ; then
	sudo systemctl --type=service | head -n -6 > "$PC_NAME/misc/services_root.txt"
	systemctl --type=service --user | head -n -6 > "$PC_NAME/misc/services_user.txt"
fi

./bootstrap.sh "$PC_NAME" "$THEME_NAME"

echo
blue "  --> <--"
blue "Resync done."
blue "  --> <--"
