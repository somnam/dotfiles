if command -v rg > /dev/null 2>&1; then
    rg-py() {
        rg --type py --smart-case $@
    }

    rg-f() {
        if [ -z "$2" ]; then
            rg --files . | rg "$1"
        else
            rg --files "$2" | rg "$1"
        fi
    }
fi
