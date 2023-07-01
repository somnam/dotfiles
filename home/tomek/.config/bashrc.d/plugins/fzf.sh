# Check fzf
[[ -d "$HOME/.fzf" ]] || return

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
    export PATH="$HOME/.fzf/bin${PATH:+:$PATH}"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.bash"

# Setting fd as the default source for fzf
if command -v rg > /dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore -g '!.git'"
fi
