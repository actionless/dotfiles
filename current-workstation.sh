#!/bin/sh
basename $(readlink -e $(dirname $(readlink -e ~/.Xresources_workstation)))
