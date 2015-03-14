#!/bin/dash
tune="$*";
volume="0.4";
if [ ! "$tune" ];then echo "Usage: $0 tempo freq dur (freq dur freq dur...)" >&2;exit 1;fi
f="";tmpdir=$(mktemp -d);for d in $tune;do if [ ! "$t" ];then t=$d;elif [ ! "$f" ];then f=$d;
else sox -v $volume -e mu-law -r 8000 -n -t raw - synth $(echo "$d*(60/$t)"|bc -l) sine $f >>$tmpdir/grubtune.ul;f="";fi;done;
sox -v $volume -c1 -r 8000 $tmpdir/grubtune.ul $tmpdir/grubtune.au;play -q $tmpdir/grubtune.au;/bin/rm -r $tmpdir
