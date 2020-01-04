#!/usr/bin/env fish
for file in (fd --size=+1500K $argv[1]) ; jpegoptim --size=1500k $file ; end
