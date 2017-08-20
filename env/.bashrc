# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ $- != *i* ]]; then
  return
fi

shopt -s histappend
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoredups:ignorespace

shopt -s checkwinsize

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

# xterm title:
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\n\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# User specific aliases and functions

alias ls='ls --human-readable --file-type --group-directories-first --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias diff='git diff --color-words'

#PS1='$ '
PS2='> '
PS2=''
PS3='> '
PS4='+ '

# command prompt:
case "$(whoami)" in
lie)
	PS1=' \[\e[35m\][\u \[\e[32m\]\w\[\e[35m\]]\e[31m$(parse_git_branch_and_add_brackets) \[\033[0m\]\n\$ '
	;;
root)
	PS1=' [\[\e[41m\]\u\[\e[0m\] \[\e[32m\]\w\[\e[0m\]]\e[31m$(parse_git_branch_and_add_brackets) \[\033[0m\]\n# '
	;;
*)
	PS1=' [\[\e[33m\]\u\[\e[0m\] \[\e[32m\]\w\[\e[0m\]]\e[31m$(parse_git_branch_and_add_brackets) \[\033[0m\]\n$ '
	;;
esac

# colored man pages:
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export TERM="xterm-256color"

# to clean-up:

#eval `dircolors -b ${HOME}/.dir_colors`
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export LC_ALL="ru_RU.utf8"
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


test -f $HOME/.profile_theme && source $HOME/.profile_theme
