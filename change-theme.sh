#!/usr/bin/env bash
set -ueo pipefail

if [ -z "${1:-}" ]; then
	# shellcheck disable=SC2010
	STOW_TARGET=$(\
		ls | grep theme- | grep "$(./current-workstation.sh | sed 's/workstation-//')" | fzf --prompt="select theme:"\
	) || (
		echo "Canceled"
		exit 1
	)
else
	STOW_TARGET=$1
fi

CURRENT_THEME=$(./current-theme.sh) || CURRENT_THEME=''
if [[ ! -z ${CURRENT_THEME} ]] ; then
	stow -D "$(./current-theme.sh)"
fi
stow "$STOW_TARGET"

set +ueo pipefail

# shellcheck source=$HOME/.profile disable=SC1091
source ~/.profile
xrdb -merge "$HOME"/.Xresources
if [[ -z "${NORESTART:-}" ]] ; then
	echo "awesome.restart()" | awesome-client || true
fi
pgrep "^xst\$" | xargs kill -s USR1
for line in $(env | grep -e ^TMUX_ -e ^FISH_ -e ^TERM_ | grep -v TMUX_PANE) ; do
	# shellcheck disable=SC2046
	key=$(cut -d'=' -f1 <<< "$line")
	value=$(cut -d'=' -f2 <<< "$line")
	if [[ -z "${value:-}" ]] ; then
		tmux setenv -g "${key}" ''
	else
		tmux setenv -g "${key}" "${value:-}"
	fi
done;
tmux source-file ~/.tmux.conf
fish -c reload_fish

if [[ -f ~/.apply_theme.sh ]] ; then
	~/.apply_theme.sh
fi

echo
echo "====================================================="
echo "== Theme was changed to '${STOW_TARGET}'"
echo "====================================================="
