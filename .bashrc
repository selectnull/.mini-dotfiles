# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=999999
HISTFILESIZE=999999

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set prompt
if [ "$USER" = "root" ]; then
    color_user="\[\033[0;31m\]" # red
else
    color_user="\[\033[0;34m\]" # blue
fi
color_reset="\[\033[00m\]"
PS1="${color_user}\u@\h ${color_reset}\w $ "
unset color_reset color_user

# aliases
alias ls='ls --color=auto --group-directories-first'
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls --color=auto -lah --group-directories-first'

alias grep='grep --color=auto'

# set PATH so it includes private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# run extra commands
if [ -f "$HOME/.extrarc" ]; then
    . "$HOME/.extrarc" 
fi
