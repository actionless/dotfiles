#!/bin/sh

SCRIPT_DIR=$(dirname $(readlink -e "$0"))
THEME_NAME=$($SCRIPT_DIR/current-theme.sh)
THEME_DIR=$SCRIPT_DIR/$THEME_NAME

mv ~/.gtkrc-2.0 $THEME_DIR/.gtkrc-2.0 ;
mv ~/.config/gtk-3.0/settings.ini $THEME_DIR/.config/gtk-3.0/ ;

./bootstrap-dell.fish $THEME_NAME &&

echo "done"
