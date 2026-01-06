if command -v brew >/dev/null; then
    brew-up() {
        brew update && brew outdated && brew upgrade --ask $@ && brew autoremove
    }

    brew-prune() {
        brew uninstall --zap $@ && brew autoremove
    }

    brew-clean() {
        brew autoremove && brew cleanup --prune=all
    }
fi
