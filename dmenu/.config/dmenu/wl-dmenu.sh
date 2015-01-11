#!/bin/sh

FN='Monospace-8:Bold'

# light:
#NB='#d8d8d8'
#NF='#101010'
#SB='#ad7fa8'
#SF='#000000'

# lcars:
NB='#cc6699'
NF='#000000'
SB='#000000'
SF='#cc6699'

OPTIONS='-b'
eval "exec dmenu-wl -fn '"$FN"' -nb '"$NB"' -nf '"$NF"' -sb '"$SB"' -sf '"$SF"' "$OPTIONS
