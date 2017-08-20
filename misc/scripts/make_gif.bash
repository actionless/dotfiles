#!/bin/bash

set -uex

target=${1-./*.jpg}
delay=${2-11}
resize=${3-500}

workdir=$(mktemp -d)
cleanup() {
	echo "Cleaning-up..."
	rm -r ${workdir}
}
trap cleanup EXIT

current_dir=${PWD}

echo "copying files..."
cp ${target} ${workdir}/
cd ${workdir}
echo "optimizing source images..."
mogrify -resample 72x72 -resize ${resize}x${resize} ./*
echo "creating gif..."
convert -delay ${delay} -loop 0 ./* myimage.gif
echo "optimizing gif..."
gifsicle --batch --optimize=3 --colors 256 myimage.gif;
echo "cleaning-up..."
mv myimage.gif ${current_dir}/
cd ${current_dir}
echo "DONE"
ls -lh ./myimage.gif
viewnior ./myimage.gif
