#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$( dirname $SCRIPT_DIR )

DOTFILES=( .profile .bashrc .vimrc .tmux.conf .gitconfig )
for f in ${DOTFILES[@]}; do
    rm -f ~/$f
    ln -s $ROOT_DIR/$f ~/$f
done
