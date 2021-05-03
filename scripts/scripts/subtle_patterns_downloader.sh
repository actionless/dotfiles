#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'


DEST_DIR=~/images/subtle_patterns
if [[ ! -d ${DEST_DIR} ]] ; then
	mkdir ${DEST_DIR}
fi
echo "Working directory: ${DEST_DIR}"
echo
cd ${DEST_DIR}

url_prefix="https://www.toptal.com"
page_url_template=${url_prefix}"/designers/subtlepatterns/page/"

for page in $(seq 48) ; do
	echo
	echo "Page #${page}:"
	echo
	url=$(sed -e 's/page\/1\///g' <<< "${page_url_template}${page}/")
	sed_prefix=$(sed -e 's/\//\\\//g'<<< ${url_prefix})
	for img_link in $( curl ${url} 2>&1 \
		| grep 'class="patternpreview"' \
		| sed -E 's/.*url\('"'"'(http.*)'"'"'\).*/\1/g' \
		| sed -E 's/.*url\('"'"'(.*)'"'"'\).*/'"${sed_prefix}"'\1/g' \
		| sed -E 's/.*url\((.*)\).*/'"${sed_prefix}"'\1/g'
	) ; do
		filename=$(basename ${img_link})
		if [[ -f ${filename} ]] ; then
			echo
			echo "Up-to-date"
			exit 0
			#continue
		fi
		echo "Downloading ${img_link}..."
		curl ${img_link} -o ${filename}
	done
done

echo
echo "Synchronized full collection"
exit 0
