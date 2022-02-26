#!/usr/bin/env bash
set -ueo pipefail

# apitrace trace projectMSDL
## apitrace replay projectMSDL.trace

input_file=$1
output_file=$2

#apitrace dump-images -o - "$input_file" | \
#ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i pipe: -c:v libx264 -preset slow -b:v 8000k -pass 1 -f mp4 /dev/null
#echo 1111111111111111111111111
apitrace dump-images -o - "$input_file" | \
ffmpeg -r 60 -f image2pipe -vcodec ppm -i pipe: -c:v libx264 -preset slow -b:v 8000k -pass 2 -f mp4 "$output_file"
