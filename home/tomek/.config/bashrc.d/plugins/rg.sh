if command -v rg > /dev/null 2>&1; then
    rgpy() {
        rg --type py --smart-case "$@"
    }
fi
