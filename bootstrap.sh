#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"


purp() {
	echo "[35m$* [30m[m"
}
green() {
	echo "[32m$* [30m[m"
}
red() {
	echo "[31m$* [30m[m"
}
cyan() {
	echo "[36m$*[30m[m"
}


test -z "${1:-}" &&
echo "Usage: $0 PC_NAME THEME_NAME" &&
echo "Usage: $0 (dell|thinkpad) (theme-dell-lcars|...)" &&
exit 1

PC_NAME="$1"
THEME_NAME="${2:-}"


echo
purp ":: Bootstrapping the config:"


unstow_old_config=""
current_workstation=$(./current-workstation.sh) || unstow_old_config=1
if [[ -n "$unstow_old_config" ]] ; then
	purp ":: Unstowing old workstation-level config:"
	stow -D "$current_workstation" || true
fi


for CONFIG in $(
	find ./ -maxdepth 1 \
		-type d \
		-not -name '*bak' \
		-not -name '.*' \
		-not -name 'theme-*' \
		-not -name 'workstation-*' \
		-not -name '_*' \
		-not -name 'src' \
		-not -name 'pkg' \
		-exec basename {} \; ;
	echo "$PC_NAME"
); do
	echo -n "${CONFIG}: " ;
	if stow "$CONFIG"; then
		green "ok"
	else
		red "FAILED"
	fi
done

echo
purp ":: Changing the theme to $(cyan "$THEME_NAME"):"
"$SCRIPT_DIR"/change-theme.sh "$THEME_NAME"
green ":: Bootstrapped successfully"
