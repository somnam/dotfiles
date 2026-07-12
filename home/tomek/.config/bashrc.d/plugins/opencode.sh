if [[ -d "$HOME/.opencode" ]]; then
    if [[ ":$PATH:" != *":$HOME/.opencode/bin:"* ]]; then
        export PATH="$HOME/.opencode/bin${PATH:+:$PATH}"
    fi
fi
