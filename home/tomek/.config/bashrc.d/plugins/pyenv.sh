if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"

    if [[ ":$PATH:" != *":${PYENV_ROOT}/bin:"* ]]; then
        export PATH="${PYENV_ROOT}/bin${PATH:+:$PATH}"
    fi

    # Lazy load pyenv
    if command -v pyenv &>/dev/null; then
        if [[ ":$PATH:" != *":${PYENV_ROOT}/shims:"* ]]; then
            export PATH="${PYENV_ROOT}/shims${PATH:+:$PATH}"
        fi
        function pyenv() {
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
