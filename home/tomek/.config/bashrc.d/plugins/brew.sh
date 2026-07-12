if command -v brew &>/dev/null; then
    local brew_prefix="$(brew --prefix 2>/dev/null)"
    [[ -n "${brew_prefix}" ]] || return
    remove_path "${brew_prefix}/bin"
    remove_path "${brew_prefix}/sbin"
    eval "$(brew shellenv)"
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/openjdk/bin" ]]; then
    prepend_path "${HOMEBREW_PREFIX}/opt/openjdk/bin"
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/libpq/bin" ]]; then
    prepend_path "${HOMEBREW_PREFIX}/opt/libpq/bin"
fi
