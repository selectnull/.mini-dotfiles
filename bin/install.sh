#!/usr/bin/env bash

DOTFILES=( .vimrc .tmux.conf .gitconfig )

cd
for f in ${DOTFILES}; do
    echo $f
    # ln -s $f
done
