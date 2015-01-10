#!/bin/sh
SCRIPT_DIR=$(dirname $(readlink -e "$0"))
THEME_DIR=$SCRIPT_DIR/$($SCRIPT_DIR/current_theme.sh)
mv ~/.gtkrc-2.0 $THEME_DIR/.gtkrc-2.0 ;
mv ~/.config/gtk-3.0/settings.ini $THEME_DIR/.config/gtk-3.0/ ;
./bootstrap-dell.fish &&
echo "done"
