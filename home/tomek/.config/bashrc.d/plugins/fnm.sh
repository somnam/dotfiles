if command -v fnm >/dev/null; then
    if [[ ":$PATH:" != *":$HOME/.local/state/fnm_multishells/"* ]]; then
        eval "$(fnm env --use-on-cd)"
    fi
fi
