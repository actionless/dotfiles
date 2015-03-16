#!/bin/sh

SCRIPT_DIR=$(readlink -e $(dirname "$0"))

cd /etc/modules-load.d/
rm video.conf
cp -r $SCRIPT_DIR/nouveau.modules nouveau.option &&
ln -s nouveau.option video.conf

cd /etc/X11/xorg.conf.d/
rm 20-video.conf
cp -r $SCRIPT_DIR/nouveau.xorg nouveau.option &&
ln -s nouveau.option 20-video.conf

pacman -R nvidia-340xx-ck-core2
pacman -R nvidia-340xx-utils
pacman -R opencl-nvidia-340xx
pacman -R libvdpau
pacman -R lib32-libvdpau
pacman -S --needed mesa-libgl lib32-mesa-libgl xf86-video-nouveau
