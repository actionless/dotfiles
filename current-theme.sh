#!/bin/sh
basename $(dirname $(readlink -e ~/.Xresources)) || echo "Not bootstrapped"
