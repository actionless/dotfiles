#!/bin/sh
set -ueo pipefail

if [ -z "${1:-}" ]; then
	STOW_TARGET=$(ls | grep theme- | grep $(./current-workstation.sh | sed 's/workstation-//') | fzf --prompt="select theme:") || (echo "Canceled" ; exit 1)
else
	STOW_TARGET=$1
fi

CURRENT_THEME=$(./current-theme.sh) || CURRENT_THEME=''
if [[ ! -z ${CURRENT_THEME} ]] ; then
	stow -D $(./current-theme.sh) ;
fi
stow "$STOW_TARGET"

set +ueo pipefail

xrdb -merge $HOME/.Xresources
source ~/.profile
echo "awesome.restart()" | awesome-client || true
pgrep "^st\$" | xargs kill -s USR1
for line in $(env | grep -e ^TMUX_ -e ^FISH_ -e ^TERM_ | grep -v TMUX_PANE) ; do
	tmux setenv -g $(tr '=' ' ' <<< $line) ;
done;
tmux source-file ~/.tmux.conf
fish -c reload_fish

echo
echo "====================================================="
echo "== Theme was changed to '${STOW_TARGET}'"
echo "====================================================="
