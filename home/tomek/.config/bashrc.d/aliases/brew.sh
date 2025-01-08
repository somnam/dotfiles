if command -v brew >/dev/null; then
    brew-out() {
        brew update && brew outdated --greedy
    }

    brew-up() {
        brew update && brew upgrade --greedy --no-quarantine && brew autoremove
    }

    brew-prune() {
        brew uninstall --zap $@ && brew autoremove
    }

    brew-clean() {
        brew autoremove && brew cleanup --prune=all
    }
fi
