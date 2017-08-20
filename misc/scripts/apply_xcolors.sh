#!/bin/bash

change_color () {
  case $1 in
  color*)
    send_osc 4 "${1#color};$2" ;;
  foreground)
    send_osc 10 "$2" ;;
  background)
    send_osc 11 "$2" ;;
  cursor)
    send_osc 12 "$2" ;;
  mouse_foreground)
    send_osc 13 "$2" ;;
  mouse_background)
    send_osc 14 "$2" ;;
  highlight)
    send_osc 17 "$2" ;;
  border)
    send_osc 708 "$2" ;;
  esac
}


send_escape_sequence () {
  escape_sequence="$1"

  # wrap escape sequence when within a TMUX session
  [ ! -z "$TMUX" ] && escape_sequence="${DSC}tmux;${ESC}${escape_sequence}${ESC}\\"

  printf "${escape_sequence}"
}

send_osc () {
  Ps=$1
  Pt=$2
  command="$OSC$Ps;$Pt$BEL"
  send_escape_sequence $command
}

ESC="\033"
BEL="\007"
DSC="${ESC}P"
OSC="${ESC}]"

colors=( background foreground cursor mouse_background mouse_foreground highlight border color0 color1 color2 color3 color4 color5 color6 color7 color8 color9 color10 color11 color12 color13 color14 color15 )
color_names=( black red green yellow blue magenta cyan white brblack brred brgreen bryellow brblue brmagenta brcyan brwhite )

set_colors () {
  for color in ${colors[@]}; do
    value=$(xrdb -query | grep ^*$color\: | cut -f2)
    [[ $value ]] && change_color "$color" "$value"
  done
}

set_colors
