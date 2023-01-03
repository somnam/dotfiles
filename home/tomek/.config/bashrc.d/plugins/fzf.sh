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
