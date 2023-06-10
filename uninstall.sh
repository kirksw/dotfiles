#!/bin/zsh

echo '#####################################################'
echo '## Un-stowing Config and Resource Files            ##'
echo '#####################################################'

## Link dotfiles
if [ -f "/etc/arch-release" ]; then
	echo 'Stowing arch configs'
  pushd config-nix
  for PACKAGE in $(ls -d */); do
		stow -D --no-folding -t $HOME $PACKAGE
	done
  popd

	echo 'Stowing *nix resources'
  pushd resources
  for PACKAGE in $(ls -d */); do
		stow -D --no-folding -t $HOME $PACKAGE
	done
  popd
fi

if [[ $OSTYPE == 'darwin'* ]]; then
	echo 'Stowing macos configs'
  pushd config-mac
  for PACKAGE in $(ls -d */); do
		stow -D --no-folding -t $HOME $PACKAGE
	done
  popd
fi

echo 'Stowing common configs'
  pushd config
  for PACKAGE in $(ls -d */); do
    stow -D --no-folding -t $HOME $PACKAGE
  done
  popd

echo 'Stowing private configs/resources'
pushd private
for PACKAGE in $(ls -d */); do
  echo "stowing private package [$PACKAGE]"
	stow -D --no-folding -t $HOME $PACKAGE 
done
popd

echo '#####################################################'
echo '## Un-stowing Config and Resource Files            ##'
echo '#####################################################'

echo 'Note: only the dotfiles were uninstalled, the tooling remains installed and would have to be manually removed.'
