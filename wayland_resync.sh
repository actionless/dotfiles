#!/bin/sh
./resync.sh
echo "-- Apply wayland Xresources..."
xrdb -merge ~/.Xresources_wayland
echo "-- Reloading xst again..."
pgrep "^xst\$" | xargs kill -s USR1
