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
	echo "== Unstowing the current theme..."
	stow -D "$(./current-theme.sh)"
fi
echo "== Stowing the new theme..."
stow "$STOW_TARGET"

set +ueo pipefail

echo "== Applying the new theme..."
# shellcheck source=$HOME/.profile disable=SC1091
echo "-- Applying profile..."
source ~/.profile
echo "-- Applying xrdb..."
xrdb -merge "$HOME"/.Xresources
if [[ -z "${NORESTART:-}" ]] ; then
	echo "-- Restarting AwesomeWM..."
	echo "awesome.restart()" | awesome-client || true
fi
echo "-- Reloading xst..."
pgrep "^xst\$" | xargs kill -s USR1
echo "-- Applying env inside tmux sessions..."
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
echo "-- Reloading tmux..."
tmux source-file ~/.tmux.conf
echo "-- Reloading fish..."
fish -c reload_fish

if [[ -f ~/.apply_theme.sh ]] ; then
	echo "-- Executing '~/.apply_theme.sh' script..."
	~/.apply_theme.sh
fi

echo
echo "====================================================="
echo "== Theme was changed to '${STOW_TARGET}'"
echo "====================================================="
