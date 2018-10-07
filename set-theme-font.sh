#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

THEME_DIR=${1:-~}

$EDITOR ${THEME_DIR}/.Xresources_theme
$EDITOR ${THEME_DIR}/.xsettingsd
$EDITOR ${THEME_DIR}/.config/fontconfig/fonts.conf
