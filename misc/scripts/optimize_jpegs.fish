#!/usr/bin/env fish
for file in (fd --size=+1500k $argv[1]) ; jpegoptim --size=1500k $file ; end
