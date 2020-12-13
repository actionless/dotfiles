#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

blue() {
	echo "[34m$*[30m[m"
}

SCRIPT_DIR=$(dirname "$(readlink -e "$0")")
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

SYM_PATHS=(
	'.config/user-dirs.dirs'
	'.gtkrc-2.0'
	'.config/gtk-3.0/settings.ini'
)
for path in "${SYM_PATHS[@]}" ; do
	if [[ -f ~/"$path" && ! -L ~/"$path" ]] ; then
		mv ~/"$path" "$THEME_DIR"/"$path" || true
	fi
done
if which pacman > /dev/null ; then
	pacman -Qqe > "$PC_NAME/misc/pacman_Qqe.txt"
fi

./bootstrap.sh "$PC_NAME" "$THEME_NAME"

echo
blue "  --> <--"
blue "Resync done."
blue "  --> <--"
