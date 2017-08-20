#!/usr/bin/env bash
set -ue
cd ~/.cache/pacaur/
echo -n "Cache size before:	"
du -sh
for file in */{*.tar*,pkg,src,*.rpm,*.deb} ; do
	rm -rf $file
done
echo -n "Cache size after:	"
du -sh
exit 0 
