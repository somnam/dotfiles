if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"

    prepend_path "${PYENV_ROOT}/bin"

    # Lazy load pyenv
    if command -v pyenv &>/dev/null; then
        prepend_path "${PYENV_ROOT}/shims"
        pyenv() {
            unset -f pyenv
            if [[ ":$PATH:" != *":$HOME/.pyenv/bin:"* ]]; then
                eval -- "$(command pyenv init - bash)"
            else
                eval -- "$(command pyenv init --no-push-path - bash)"
            fi
            pyenv "$@"
        }
    fi
fi
