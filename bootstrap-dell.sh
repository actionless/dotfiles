#!/bin/sh

for i in $(ls | grep -v -e tp -e theme -e "\.");
do
	echo -n "$i: " ;
	if stow $i; then
		echo "ok"
	else
		echo "FAILED"
	fi
done

./change-theme.sh "$@"
