#!/bin/zsh
# Pre
echo '#####################################################'
echo '## Installing pre-requisites                       ##'
echo '#####################################################'

## brew or pacman install
if [[ $OSTYPE == 'darwin'* ]]; then
	echo 'Installing dependencies for macOS'
	brew bundle --file=./.Brewfile
elif [ -f "/etc/arch-release" ]; then
	echo 'Installing dependencies for Arch'
	sudo pacman -Syyu
	# base packages
	sudo pacman -S acpi alsa-utils base-devel curl git pipewire pipewire-alsa xorg xorg-xinit xclip rofi scrot slop wezterm zsh tmux neovim picom polybar dunst i3-gaps zathura zathura-pdf-mupdf ranger ripgrep bat tree ncdu iftop htop ctags lesspipe pipx fzf lazygit zellij
else
  echo 'Sorry but your current OS is unsupported! (use macos or arch)'
	exit
fi

# Main-script
echo '#####################################################'
echo '## Stowing Config and Resource Files               ##'
echo '#####################################################'

## Remove existing stowed directories
for EXISTING in $(find $HOME/.config -maxdepth 1 -type l); do
  echo "Removing existing stow file/directory [$EXISTING]"
  rm $EXISTING
done

## Link dotfiles
if [ -f "/etc/arch-release" ]; then
	echo 'Stowing arch configs'
  pushd config-nix
  for PACKAGE in $(ls -d */); do
		stow -S --no-folding -t $HOME $PACKAGE
	done
  popd

	echo 'Stowing *nix resources'
  pushd resources
  for PACKAGE in $(ls -d */); do
		stow -S --no-folding -t $HOME $PACKAGE
	done
  popd
fi

if [[ $OSTYPE == 'darwin'* ]]; then
	echo 'Stowing macos configs'
  pushd config-mac
  for PACKAGE in $(ls -d */); do
		stow -S --no-folding -t $HOME $PACKAGE
	done
  popd
fi

echo 'Stowing common configs'
  pushd config
  for PACKAGE in $(ls -d */); do
    stow -S --no-folding -t $HOME $PACKAGE
  done
  popd

echo 'Stowing private configs/resources'
pushd private
for PACKAGE in $(ls -d */); do
  echo "stowing private package [$PACKAGE]"
	stow -S --no-folding -t $HOME $PACKAGE 
done
popd

# Post
echo '#####################################################' 
echo '## Setting up tooling...                           ##'
echo '#####################################################'

## oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o /tmp/omz-install.sh && chmod +x /tmp/omz-install.sh && /tmp/omz-install.sh

### powerlevel10k theme for oh-my-zsh
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## rtx
curl -fsSL https://rtx.pub/install.sh -o /tmp/rtx-install.sh && chmod +x /tmp/rtx-install.sh && /tmp/rtx-install.sh

## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

## tmux
if [ -f $HOME/.tmux/plugins/tpm ]; then
	echo "installing missing tmux plugin manager [tpm]"
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

## Install all standard environments
rtx install

## Finished
echo '#####################################################' 
echo '## Installation completed...                       ##'
echo '#####################################################'

echo "Please ensure to run source ~/.zshrc or open a new terminal"
