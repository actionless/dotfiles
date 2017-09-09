#!/bin/bash

INPUT_PATH=${1:-assets.svg}

hextoi() {
	bc <<< "ibase=16; ${1}"
}


for hexinput in $(grep -Eo "#[0-9a-fA-F]{6}" ${INPUT_PATH} | tr '[:lower:]' '[:upper:]' | tr -d "#" | sort | uniq -c | sort -rn ) ; do
	a=$(hextoi $(cut -c-2 <<< ${hexinput}))
	b=$(hextoi $(cut -c3-4 <<< ${hexinput}))
	c=$(hextoi $(cut -c5-6 <<< ${hexinput}))
	if [[ -z ${c} ]] ; then
		printf "%4s: " "${hexinput}"
	else
		printf "#\x1b[38;2;${a};${b};${c}m$hexinput\x1b[0m\n"
	fi
done
