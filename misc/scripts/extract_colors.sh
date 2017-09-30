#!/bin/bash

PATHLIST=${@:-'assets.svg'}


hextoi() {
	bc <<< "ibase=16; ${1}"
}

parse_channel() {
	hextoi $(cut -c${2} <<< ${1})
}

print_rgba(){
	text=$1
	r=$2
	g=$3
	b=$4
	printf "#\x1b[38;2;${r};${g};${b}m$text\x1b[0m\n"
}

for hexinput in $(
	grep --extended-regexp --only-matching --no-filename "#[0-9a-fA-F]{6}" ${PATHLIST} \
	| tr '[:lower:]' '[:upper:]' \
	| tr -d "#" \
	| sort | uniq -c | sort -rn
) ; do
	r=$(parse_channel ${hexinput}  -2)
	g=$(parse_channel ${hexinput} 3-4)
	b=$(parse_channel ${hexinput} 5-6)
	if [[ -z ${b} ]] ; then
		printf "%4s: " "${hexinput}"
	else
		print_rgba ${hexinput} ${r} ${g} ${b}
	fi
done
