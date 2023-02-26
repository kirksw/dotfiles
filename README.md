# DOTFILES

## Philosphy

- This config should work on both Arch and MacOS
- The simplest tool for the job should be used (example: vim over emacs)
- If one tool can consolidate multiple, then it should be preferred (example: rtx over nvm, pyenv, etc)
- ??

## Getting started

1. Enable hidden files in Finder [optional]

`defaults write -g AppleShowAllFiles -bool true`

2. Clone repo w/ submodules:
   `git clone --recurse-submodules https://github.com/kirksw/dotfiles ~/.dotfiles`

3. Install dependencies

`~/.dotfiles/install-deps.sh`

4. Install config

`~/.dotfiles/install-all.sh`

## Information

### ZSH

The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

#### Oh-my-zsh

Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, themes, and a few things that make you shout..."Oh My ZSH!"

### Python

Python can be tricky to manage, given the various versions, toolings and dependencies. The current thinking is that rtx should manage python versions, with poetry for managing project dependencies, and finally pipx for installing tooling such the azure-cli in isolated environments.

#### Poetry

> Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

installation:

```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```

usage:

```bash
# creating new projects
poetry new poetry-demo

# intializing existing projects
poetry init

# run command under poetry environment
poetry run python main.py

# install dependencies
poetry install

# add dependency
poetry add pydantic

# add development dependency
poetry add -D black

# building
poetry build

# publishing (to private repo)
poetry publish -r my-repository
```

#### pipx

> pipx is a tool to help you install and run end-user applications written in Python. It's roughly similar to macOS's brew, JavaScript's npx, and Linux's apt.

usage:

```bash
# install isolated package
pipx install pycowsay

# list pipx packages
pipx list

# run pipx package
pycowsay moooo
```

### GO

todo :)

### Rust

todo :)

### Nodejs

#### nvm

usage:

```bash
# install nodejs version
nvm install 8.0
# use nodejs version
nvm use 8.0
```

#### npm
