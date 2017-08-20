#!/usr/sbin/fish
set FILE $argv[1];
and lua5.1  ~/scripts/codeformat.lua --file $FILE  --ts 4 --in 4 > ./file.tmp ;
and mv ./file.tmp $FILE
#or rm ./file.tmp
