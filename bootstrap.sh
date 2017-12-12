#!/bin/sh
set -ue

SCRIPT_DIR=$(readlink -e $(dirname "$0"))

test -z ${1:-} &&
echo "Usage: $0 PC_NAME THEME_NAME" &&
echo "Usage: $0 (dell|thinkpad) (theme-dell-lcars|...)" &&
exit 1

PC_NAME="$1"
THEME_NAME="${2:-}"

echo
echo "Bootstrapping the config:"

unstow_old_config=""
current_workstation=$(./current-workstation.sh) || unstow_old_config=1
if [[ ! -z "${unstow_old_config}" ]] ; then
	stow -D $(./current-workstation.sh)
fi
for CONFIG in $(
	ls \
	| grep -E -v -e "^theme-" -e "^workstation-" -e "\." -e "-bak" -e "\.bak" ;\
	echo $PC_NAME
); do
	echo -n "$CONFIG: " ;
	if stow $CONFIG; then
		echo "ok"
	else
		echo "FAILED"
	fi
done

echo
echo "Changing the theme:"
$SCRIPT_DIR/change-theme.sh "$THEME_NAME"
