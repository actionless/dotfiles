#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'


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
	sudo rm Indexers
fi
if [[ -f Indexers ]] ; then
	ls -la
	exit 2
fi
sudo ln -s Indexers."$lang" Indexers

sudo systemctl start jackett
echo 'Started. Press [Enter] to stop...'
read -r
sudo systemctl stop jackett
