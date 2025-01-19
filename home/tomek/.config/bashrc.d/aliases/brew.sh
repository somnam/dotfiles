if command -v brew >/dev/null; then
    brew-out() {
        brew update && brew outdated $@
    }

    brew-up() {
        brew update && brew upgrade $@ && brew autoremove
    }

    brew-prune() {
        brew uninstall --zap $@ && brew autoremove
    }

    brew-clean() {
        brew autoremove && brew cleanup --prune=all
    }
fi
