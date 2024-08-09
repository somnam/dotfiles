if command -v fnm >/dev/null; then
    if [[ ":$PATH:" != *":$HOME/.local/state/fnm_multishells/"* ]]; then
        eval "$(fnm env --use-on-cd)"
        source <(fnm completions --shell bash)
    fi
fi
