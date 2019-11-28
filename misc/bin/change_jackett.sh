#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ $(id -u) -ne 0 ]] ; then
	exec sudo "$0" "$@"
fi


lang=$( \
	echo "ru
en" | fzf \
)
if [[ -z "${lang}" ]] ; then
	exit 1
fi
echo
echo ":: '${lang}' language chosen"
echo

cd /var/lib/jackett


if [[ -L Indexers ]] ; then
	rm Indexers
fi
if [[ -f Indexers ]] ; then
	ls -la
	exit 2
fi
ln -s Indexers."$lang" Indexers

systemctl start jackett
systemctl start nginx
echo 'Started. Press [Enter] to stop...'
read -r
systemctl stop jackett
systemctl stop nginx
