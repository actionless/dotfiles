#!/bin/sh

set -ue

test -z "$1" && echo "Usage: $0 /path/" && exit 1

tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
db=$tmp/db
fs=$tmp/fs

mkdir "$tmp"
trap 'rm -rf "$tmp"' EXIT

echo "Dumping pacman filelist..." >&2
pacman -Qlq | sort -u > "$db"

echo "Dumping filelist from locations(s): $@..." >&2
#find /etc /opt /usr ! -name lost+found \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"
find "$@" ! -name lost+found \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

echo "Result:" >&2
comm -23 "$fs" "$db"
