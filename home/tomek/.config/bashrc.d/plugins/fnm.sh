if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd)"
    source <(fnm completions --shell bash)
fi
