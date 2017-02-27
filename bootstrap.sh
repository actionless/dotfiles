#!/bin/sh

set -ue

SCRIPT_DIR=$(readlink -e $(dirname "$0"))


PC_NAME="$1"
THEME_NAME="$2"

test -z $PC_NAME &&
echo "Usage: $0 PC_NAME" THEME_NAME&&
echo "Usage: $0 (dell|thinkpad) (theme-dell-lcars|...)" &&
exit 1

stow -D $(./current-workstation.sh) ;
for CONFIG in $(
	ls \
	| grep -E -v -e "theme-" -e "workstation-" -e "\." -e "-bak" -e "\.bak" ;\
	echo $PC_NAME
); do
	echo -n "$CONFIG: " ;
	if stow $CONFIG; then
		echo "ok"
	else
		echo "FAILED"
	fi
done

test ! -z $THEME_NAME && $SCRIPT_DIR/change-theme.sh "$THEME_NAME"
