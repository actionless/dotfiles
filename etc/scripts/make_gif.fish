#!/bin/fish
mkdir ./gif/ ;
and echo "copying files..." ;
and cp $argv ./gif/ ;
and cd ./gif/ ;
and echo "optimizing source images..." ;
and mogrify -resample 72x72 -resize 512x512 *.jpg ;
and echo "creating gif..." ;
and convert -delay 6 -loop 0 *.jpg myimage.gif ;
and echo "optimizing gif..." ;
and gifsicle --batch --optimize=3 --colors 256 myimage.gif;
and echo "cleaning-up..." ;
and mv myimage.gif ../ ;
and cd .. ;
and rm -r ./gif/ ;
and ll myimage.gif
and echo "DONE" ;
and viewnior myimage.gif
