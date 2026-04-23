# I don't really use bash, but in case if I do need it for whatever reason
# this file is there to source aliases and shorctus and some other settings.

shopt -s autocd
shopt -s globstar
shopt -s extglob
shopt -s histappend
stty -ixon

export HISTFILE="$HOME/.cache/bash/history"
export HISTCONTROL=ignoreboth
export CDPATH=$HOME/Desktop:$HOME/Pictures:$HOME/.config:$HOME/.local/bin:$HOME/Documents:$HOME/Downloads:$HOME/.cache
source "$HOME/.config/shell/aliases"
source "$HOME/.config/shell/shortcutrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]: "
[ -n $EDITOR ] || export EDITOR="vim"
