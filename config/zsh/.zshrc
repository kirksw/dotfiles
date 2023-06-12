# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# aliases
source $HOME/.config/.zsh_profile

# nvim configs
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroVim nvim"

function nvims() {
  items=("default" "AstroVim" "LazyVim" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config = ""
  fi
  NVIM_APPNAME=$config nvim $@
}

# oh-my-zsh plugins
plugins=(
    git
    direnv
    dotenv
    python
    web-search
    aliases
    encode64
    tmux
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
  )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# required for pipx & poetry
export PATH="$HOME/.local/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf

# done this way to stop it re-adding
eval "$($HOME/.local/share/rtx/bin/rtx activate zsh)"

# Created by `pipx` on 2023-03-01 08:29:34
export PATH="$PATH:/Users/dkKirSwe/.local/bin"

# Change the current directory for a tmux session, which determines
# the starting dir for new windows/panes:
function tmux-cwd {
    tmux command-prompt -I $PWD -P "New session dir:" "attach -c %1"
}

# Azure CLI autocompletions
[ -f /opt/homebrew/etc/bash_completion.d/az ] && source /opt/homebrew/etc/bash_completion.d/az

# Zellij autostart on terminal (disabled as tmux seems better still)
# eval "$(zellij setup --generate-auto-start zsh)"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2023-03-01 08:29:34
export PATH="$PATH:/Users/dkKirSwe/.local/bin"

