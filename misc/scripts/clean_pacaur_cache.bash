#!/usr/bin/env bash
set -ueo pipefail
sudo pacman -Scc
cd ~/.cache/pacaur/
echo -n "Cache size before:	"
du -sh 2>/dev/null || true
for file in */{*.tar*,pkg,src,*.rpm,*.deb} ; do
	if [[ ! $(grep -i -e spotify <<< $file) ]] ; then
		rm -rf $file
	fi
done
echo -n "Cache size after:	"
du -sh
exit 0 
