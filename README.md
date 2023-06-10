# DOTFILES

## Philosphy

- This config should work on both Arch and MacOS
- The simplest tool for the job should be used (example: vim over emacs)
- If one tool can consolidate multiple, then it should be preferred (example: rtx over nvm, pyenv, etc)
- ??

## Getting started

1. Clone repo w/ submodules:

`git clone --recurse-submodules https://github.com/kirksw/dotfiles ~/.dotfiles`

2. Install config

`~/.dotfiles/install.sh`

## Information

### Linux

For arch linux this repository includes setup for the desktop environment, consisting of:

- picom (window compositor forked from compton)
- polybar (lightweight status bar)
- rofi (window switcher - dmenu replacement)
- dunst (lightweight notification daemon)

### ZSH

The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

#### Oh-my-zsh

Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, themes, and a few things that make you shout..."Oh My ZSH!"

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

### rtx

rtx is a blazingly fast asdf clone written in rust, it allows you to easily manage tool versions for rust, java, python, etc. It has many advantages over asdf such as automatic plugin handling.

usage:

```bash
# install missing tools
rtx install

# change global tool version
rtx global python@3.11

# change local tool version
rtx local python@3.9.5
```
