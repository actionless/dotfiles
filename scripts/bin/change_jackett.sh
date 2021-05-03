#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [[ $(id -u) -ne 0 ]] ; then
	exec sudo "$0" "$@"
fi


lang="${1:-}"
if [[ -z "${lang}" ]] ; then
	lang=$( \
		echo "ru
en" | fzf \
	)
fi
if [[ -z "${lang}" ]] ; then
	exit 1
fi
echo
echo ":: '${lang}' language chosen"
echo


stop_jackett_and_nginx() {
	exit_code=$?
	set +e

	echo "Exiting..."

	systemctl stop jackett
	systemctl stop nginx

	trap - EXIT
	exit $exit_code
}

trap stop_jackett_and_nginx HUP INT TERM EXIT


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
