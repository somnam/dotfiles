if command -v dnf >/dev/null; then
    dnf-up() {
        sudo dnf upgrade $@
    }
    dnf-clean() {
        sudo dnf autoremove $@
    }
fi
