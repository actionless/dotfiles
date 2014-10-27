export WORDCHARS='-\._'
autoload -U select-word-style
select-word-style n
eval $(dircolors -b ~/.dir_colors)

export ZLSCOLORS="${LS_COLORS}"
export EDITOR="vim"

#export XDG_CURRENT_DESKTOP=gnome
export XDG_CURRENT_DESKTOP=xfce
