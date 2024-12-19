#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --mode 1920x1080 --pos 3840x1080 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off

for id in $(xinput list | grep 'wch.cn TouchScreen' | sed -E 's/.*id=([0-9]*).*/\1/g') ; do
	xinput set-prop "$id" --type=float 'Coordinate Transformation Matrix' 0.3333333333333333 0 0.6666666666666666 0 0.5 0.5 0 0 1 ;
done
