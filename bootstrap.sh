#!/bin/sh

SCRIPT_DIR=$(readlink -e $(dirname "$0"))


PC_NAME="$1"
THEME_NAME="$2"

test -z $PC_NAME &&
echo "Usage: $0 PC_NAME" THEME_NAME&&
echo "Usage: $0 (dell|thinkpad) (theme-dell-lcars|...)" &&
exit 1

test "$PC_NAME" = "dell" && EXCLUDE_CONFIG="(thinkpad|h50)"
test "$PC_NAME" = "thinkpad" && EXCLUDE_CONFIG="(dell|h50)"
test "$PC_NAME" = "h50" && EXCLUDE_CONFIG="(dell|thinkpad)"

for CONFIG in $(ls | grep -E -v -e "$EXCLUDE_CONFIG" -e "theme-" -e "\.");
do
	echo -n "$CONFIG: " ;
	if stow $CONFIG; then
		echo "ok"
	else
		echo "FAILED"
	fi
done

$SCRIPT_DIR/change-theme.sh "$THEME_NAME"
