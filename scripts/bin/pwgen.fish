#!/usr/bin/env fish
head -c 8192 /dev/urandom | tr -dc 'a-zA-Z0-9~!@#$%^&*_-' | fold -w (math 1 + RANDOM \% 32) | head -n 1 | shuf
