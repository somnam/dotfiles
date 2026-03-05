if [[ -d "$HOME/.fzf" ]]; then
    if [[ ":$PATH:" != *":$HOME/.fzf/bin:"* ]]; then
        export PATH="$HOME/.fzf/bin${PATH:+:$PATH}"
    fi
fi

if command -v fzf > /dev/null; then
    export FZF_DEFAULT_COMMAND="find . -type f"
    if command -v rg > /dev/null; then
        export FZF_DEFAULT_COMMAND="rg --files"
    elif command -v fd > /dev/null; then
        export FZF_DEFAULT_COMMAND="fd --type f"
    fi

    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    export FZF_ALT_C_COMMAND="find . -type d"
    if command -v fd > /dev/null; then
        export FZF_ALT_C_COMMAND="fd --type d"
    fi

    eval "$(fzf --bash)"
fi
