if [[ -d "$HOME/.fzf" ]]; then
    if [[ ":$PATH:" != *":$HOME/.fzf/bin:"* ]]; then
        export PATH="$HOME/.fzf/bin${PATH:+:$PATH}"
    fi
fi

if command -v fzf > /dev/null; then
    eval "$(fzf --bash)"
fi
