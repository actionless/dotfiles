#!/bin/sh

SCRIPT_DIR=$(readlink -e $(dirname "$0"))

cd /etc/modules-load.d/
rm video.conf
cp -r $SCRIPT_DIR/blob.modules blob.option &&
ln -s blob.option video.conf

cd /etc/X11/xorg.conf.d/
rm 20-video.conf
cp -r $SCRIPT_DIR/blob.xorg blob.option &&
ln -s blob.option 20-video.conf

pacman -S nvidia-340xx-ck-core2 lib32-libvdpau libvdpau libcl nvidia-340xx-utils opencl-nvidia-340xx --needed
