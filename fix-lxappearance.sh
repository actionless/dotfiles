#!/bin/sh

SCRIPT_DIR=$(dirname $(readlink -e "$0"))
THEME_NAME=$($SCRIPT_DIR/current-theme.sh)
THEME_DIR=$SCRIPT_DIR/$THEME_NAME

PC_NAME="$1"
test -z $PC_NAME &&
echo "Usage: $0 PC_NAME" &&
echo "Usage: $0 (dell|thinkpad)" &&
exit 1

mv ~/.gtkrc-2.0 $THEME_DIR/.gtkrc-2.0 ;
mv ~/.config/gtk-3.0/settings.ini $THEME_DIR/.config/gtk-3.0/ ;

./bootstrap.sh "$PC_NAME" $THEME_NAME &&

echo "done"
