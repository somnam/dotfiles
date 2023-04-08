brew-out() {
    brew update && brew outdated -g
}

brew-up() {
    brew update && brew upgrade -g && brew-clean
}

brew-prune() {
    brew uninstall --zap $@ && brew-clean
}

brew-clean() {
    brew autoremove && brew cleanup --prune=all
}
