#!/bin/bash

set -uex

#export MAGICK_OCL_DEVICE=OFF

target=${1-./*.jpg}
delay=${2-11}
resize=${3-500}
output_format=${4:-gif}

workdir=$(mktemp -d)
cleanup() {
	echo "Cleaning-up..."
	rm -r "$workdir"
}
trap cleanup EXIT

current_dir=${PWD}

echo "copying files..."
cp "$target" "${workdir}/"
cd "$workdir"

if [[ "$resize" != 0 ]] ; then
	echo "optimizing source images..."
	mogrify -resample 72x72 -resize "${resize}x${resize}" ./*
fi

echo "creating gif..."
convert -delay "$delay" -loop 0 ./* myimage.gif

if [[ "$output_format" == "gif" ]] ; then
	echo "optimizing gif..."
	gifsicle --batch --optimize=3 --colors 256 myimage.gif;
fi

echo "moving result to the current directory..."
mv myimage.gif "${current_dir}/"
cd "$current_dir"
if [[ "$output_format" != "gif" ]] ; then
	echo "converting to ${output_format}..."
	ffmpeg -i ./myimage.gif "./myimage.${output_format}"
	rm ./myimage.gif
fi

echo "DONE"

mpvn --loop "./myimage.${output_format}"
