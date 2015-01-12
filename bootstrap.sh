#!/bin/sh

PC_NAME="$1"
THEME_NAME="$2"

test -z $PC_NAME &&
echo "Usage: $0 PC_NAME" THEME_NAME&&
echo "Usage: $0 (dell|thinkpad) (theme-dell-lcars|...)" &&
exit 1

test "$PC_NAME" = "dell" && EXCLUDE_CONFIG="thinkpad"
test "$PC_NAME" = "thinkpad" && EXCLUDE_CONFIG="dell"

for CONFIG in $(ls | grep -E -v -e "$EXCLUDE_CONFIG" -e "theme-" -e "\.");
do
	echo -n "$CONFIG: " ;
	if stow $CONFIG; then
		echo "ok"
	else
		echo "FAILED"
	fi
done

./change-theme.sh "$THEME_NAME"
