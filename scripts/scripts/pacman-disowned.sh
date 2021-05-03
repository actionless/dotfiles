#!/bin/bash

set -ue

tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
db=$tmp/db
fs=$tmp/fs

mkdir "$tmp"
trap 'rm -rf "$tmp"' EXIT

echo "Dumping pacman filelist..." >&2
pacman -Qlq | sort -u > "$db"

echo "Dumping filelist..." >&2
#find /etc /opt /usr ! -name lost+found \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"
find / \
	! -name lost+found \
	-not -path "/home/*" \
	-not -path "/root/*" \
	-not -path "/dev/*" \
	-not -path "/mnt/*" \
	-not -path "/proc/*" \
	-not -path "/run/*" \
	-not -path "/sys/*" \
	-not -path "/tmp/*" \
	-not -path "/var/lib/pacman/*" \
	-not -path "/var/log/*" \
	-not -path "/var/tmp/*" \
	\( -type d -printf '%p/\n' -o -print \) \
| sort > "$fs"

echo "Result:" >&2
comm -23 "$fs" "$db"
