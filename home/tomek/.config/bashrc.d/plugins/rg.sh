if command -v rg > /dev/null 2>&1; then
    rgpy() {
        rg --type py --smart-case "$@"
    }

    rgf() {
        if [[ -z "$2" ]]; then
            rg --files . | rg "$1"
        else
            rg --files "$2" | rg "$1"
        fi
    }
fi
