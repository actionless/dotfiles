#!/bin/sh
#
# dmenu_path: Override dmenu_path sorting results by atime.
#
# By default, dmenu_path sorts executables alphabetically. It seems to make
# more sense to sort them by atime in an effort to reduce the number of
# keystrokes needed to start a program.

echo $PATH | tr ':' '\n' | uniq | sed 's#$#/#' | # List directories in $PATH
    xargs ls -lu --time-style=+%s |              # Add atime epoch
    awk '/^(-|l)/ { print $6, $7 }' |            # Only print timestamp and name
    sort -run | cut -d' ' -f 2
