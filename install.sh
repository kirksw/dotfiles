#!/bin/sh
# Pre
## brew or pacman install
if [[ $OSTYPE == 'darwin'* ]]; then
    echo 'Installing dependencies for macOS'
    brew bundle --file=./.Brewfile
elif [ -f "/etc/arch-release" ]; then
    echo 'Installing dependencies for Arch'
    sudo pacman -Syyu
    # base packages
    sudo pacman -S acpi alsa-utils base-devel curl git pipewire pipewire-alsa xorg xorg-xinit xclip rofi scrot slop wezterm zsh tmux neovim picom polybar dunst i3-gaps zathura zathura-pdf-mupdf ranger ripgrep bat tree ncdu iftop htop ctags lesspipe pipx fzf
else
    echo 'Sorry but your current OS is unsupported!'
    exit 
fi

# Main-script
## Link dotfiles
if [ -f "/etc/arch-release" ]; then
    echo 'Stowing arch dirs'
    for PACKAGE in dunst i3 mpd picom polybar rofi
    do
        stow -R -v -d config -t $HOME $PACKAGE
    done
fi

echo 'Stowing common dirs'
for PACKAGE in git nvim ranger rtx tmux wezterm zsh
do
    stow -R -v -d config -t $HOME $PACKAGE
done

# Post
## oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o /tmp/omz-install.sh && chmod +x /tmp/omz-install.sh && /tmp/omz-install.sh

rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## rtx
curl -fsSL https://rtx.pub/install.sh -o /tmp/rtx-install.sh && chmod +x /tmp/rtx-install.sh && /tmp/rtx-install.sh

## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

## tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

## Install all standard environments
rtx install --all

## wallpapers
cp -r ./wallpapers/* $HOME/Pictures/wallpapers

## scripts
sudo cp -r ./scripts/* /usr/local/bin/
