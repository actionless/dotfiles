#!/bin/sh
basename $(readlink -e $(dirname $(readlink -e ~/.config/mpv/mpv.conf))/../../)
