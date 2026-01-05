if command -v rg > /dev/null; then
    export RIPGREP_CONFIG_PATH=$HOME/.config/rg/ripgreprc

    rgpy() {
        rg --type py "$@"
    }
fi
