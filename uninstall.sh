#!/bin/zsh

echo 'Unstowing common dirs'
for PACKAGE in git nvim ranger rtx tmux wezterm zsh
do
    stow -D -v -d config -t $HOME $PACKAGE
done

