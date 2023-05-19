# TODO: rewrite to support arch and macos

if [[ $OSTYPE == 'darwin'* ]]; then
	echo 'Installing dependencies for macOS'
	brew bundle --file=./.Brewfile
elif [ -f "/etc/arch-release" ]; then
	echo 'Installing dependencies for Arch'
else
	echo 'Sorry but your current OS is unsupported!'
	exit
fi

# zsh
## ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# python
## poetry
pipx install poetry
