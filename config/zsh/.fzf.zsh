# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kirk/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kirk/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kirk/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/kirk/.fzf/shell/key-bindings.zsh"
