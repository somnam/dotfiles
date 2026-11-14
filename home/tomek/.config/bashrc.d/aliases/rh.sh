if command -v dnf &>/dev/null; then
    dnf-up() {
        sudo dnf upgrade "$@" && sudo systemctl daemon-reload
        command -v flatpak &>/dev/null && [ "$(flatpak list --app 2>/dev/null | wc -l)" -gt 0 ] && flatpak update
    }
    dnf-clean() {
        sudo dnf autoremove "$@"
        command -v flatpak &>/dev/null && [ "$(flatpak list 2>/dev/null | wc -l)" -gt 0 ] && flatpak uninstall --unused
    }
fi
