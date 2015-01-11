#!/bin/sh

TERMI="st -e fish -c"
CACHE="$HOME/.pcache/dmenu_recent"
DMENU_CMD="$HOME/.config/dmenu/dmenu.sh"

# respect atime:
#DMENU_PATH_CMD="$HOME/.config/dmenu/dmenu-path.sh"

# noatime:
DPATH=$(echo $PATH | tr ':' ' ')
DMENU_PATH_CMD="stest -flx $DPATH"


MOST_USED=$(sort $CACHE | uniq -c | sort -rn | colrm 1 8)

# Sorted by most used:
RUN=$((echo "$MOST_USED"; $DMENU_PATH_CMD | grep -vxF "$MOST_USED")| $DMENU_CMD "$@") &&
# Sorted uniq (by name):
#RUN=$((echo "$MOST_USED"; $DMENU_PATH_CMD) | sort -u | $DMENU_CMD "$@") &&
# Sorted by last called (not unique):
#RUN=$((echo "$MOST_USED"; $DMENU_PATH_CMD) | $DMENU_CMD "$@") &&

(echo $RUN; cat $CACHE) > $CACHE.$$ && mv $CACHE.$$ $CACHE

case $RUN in
    *\;) exec $TERMI "$RUN";;
    *) exec $RUN;;
esac

case $RUN in
    *\;) exec $TERMI "$RUN";;
    *) exec $RUN;;
esac
