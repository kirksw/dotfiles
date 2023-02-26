# update all packages
sudo pacman -Syyu

# tmux, git, kitty
sudo pacman -S tmux git kitty

# zsh
sudo pacman -S zsh

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# python
sudo pacman -S python
python -m pip install --upgrade pip

## poetry
curl -sSL https://install.python-poetry.org | python3 -

## pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# node
## nvm
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)"

