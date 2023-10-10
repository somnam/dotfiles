brew-out() {
    brew update && brew outdated --greedy
}

brew-up() {
    brew update && brew upgrade --greedy --no-quarantine && brew-clean
}

brew-prune() {
    brew uninstall --zap $@ && brew-clean
}

brew-clean() {
    brew autoremove && brew cleanup --prune=all
}
