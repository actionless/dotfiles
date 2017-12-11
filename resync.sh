#!/bin/sh
set -ue

SCRIPT_DIR=$(dirname $(readlink -e "$0"))
THEME_NAME="${2-}"
if [[ -z ${THEME_NAME} ]] ; then
	THEME_NAME=$($SCRIPT_DIR/current-theme.sh)
fi
THEME_DIR=$SCRIPT_DIR/$THEME_NAME

PC_NAME="${1-}"
if [ -z $PC_NAME ] ; then
	PC_NAME=$($SCRIPT_DIR/current-workstation.sh)
fi
PC_NAME=$(basename ${PC_NAME})

test ! -L ~/.gtkrc-2.0 && mv ~/.gtkrc-2.0 $THEME_DIR/.gtkrc-2.0
test ! -L ~/.config/gtk-3.0/settings.ini && mv ~/.config/gtk-3.0/settings.ini $THEME_DIR/.config/gtk-3.0/settings.ini

./bootstrap.sh "$PC_NAME" $THEME_NAME

echo "done"
