#!/bin/zsh
pushd $(dirname "$0") 
for folder in $(ls -d */) 
do
    echo "stowing $folder"
    stow -D $folder
    stow $folder
done
popd
