if command -v dnf >/dev/null; then
    alias dnf-up="sudo dnf upgrade"
    alias dnf-clean="sudo dnf autoremove"
fi
