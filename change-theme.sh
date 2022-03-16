#!/usr/bin/env bash
set -ueo pipefail

warn() {
	echo "[33m$* [30m[m"
}

if [ -z "${1:-}" ]; then
	# shellcheck disable=SC2010
	STOW_TARGET=$(\
		ls | grep theme- | grep "$(./current-workstation.sh | sed 's/workstation-//')" | fzf --prompt="select theme:" \
	) || (
		warn "Canceled"
		exit 1
	)
else
	STOW_TARGET=$1
fi

CURRENT_THEME=$(./current-theme.sh) || CURRENT_THEME=''

if [[ -n ${CURRENT_THEME} ]] ; then
	warn "== Unstowing the current theme..."
	stow -D "$(./current-theme.sh)"
fi

warn "== Stowing the new theme..."
stow "$STOW_TARGET"

set +ueo pipefail

warn "== Applying the new theme..."

warn "-- Applying profile..."
# shellcheck source=$HOME/.profile disable=SC1091
source ~/.profile

if ! which xrdb ; then
	warn "!! xrdb is not installed"
else
	warn "-- Applying xrdb..."
	xrdb -merge "$HOME"/.Xresources
fi

if ! which awesome-client ; then
	warn "!! awesome is not installed"
else
	if [[ -z "${NORESTART:-}" ]] ; then
		warn "-- Restarting AwesomeWM..."
		echo "awesome.restart()" | awesome-client || true
	fi
fi

if ! which tmux ; then
	warn "!! tmux is not installed"
else
	warn "-- Applying env inside tmux sessions..."
	IFS=$'\n'
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

	warn "-- Reloading tmux..."
	tmux source-file ~/.tmux.conf
fi

warn "-- Reloading fish..."
fish -c reload_fish

# move to the end or debug this? https://github.com/gnotclub/xst/blob/1df15396883870cc9dfd19cbddc0a88e81849fb2/src/st.c#L4671
warn "-- Reloading xst..."
pgrep "^xst\$" | xargs kill -s USR1

if [[ -f ~/.apply_theme.sh ]] ; then
	warn "-- Executing '~/.apply_theme.sh' script..."
	~/.apply_theme.sh
fi

echo
echo "====================================================="
echo "== Theme was changed to '${STOW_TARGET}'"
echo "====================================================="
