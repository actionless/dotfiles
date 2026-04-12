#!/usr/bin/env bash
set -ueo pipefail

input_file="$(readlink -e "$1")"
output_file="${input_file%.pdf}_opti.pdf"

if [[ -f "$output_file" ]] ; then
	echo " !! ⛔️  $output_file already exists !!"
	exit 1
fi

gs \
	-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -dColorImageResolution=75 -sOutputFile="$output_file" "$input_file"

echo " :: 👌😸 Saved to $output_file"
