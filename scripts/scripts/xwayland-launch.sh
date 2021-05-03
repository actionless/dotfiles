#!/bin/sh
xrdb -merge ~/.Xresources_wayland
exec  $@
