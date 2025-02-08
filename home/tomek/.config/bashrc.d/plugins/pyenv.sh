if [ -d ${HOME}/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH="${PYENV_ROOT}/bin:${PATH}"

    # Lazy load pyenv
    if type pyenv > /dev/null; then
        export PATH="${PYENV_ROOT}/shims:${PATH}"
        function pyenv() {
            unset -f pyenv
            if [[ ":$PATH:" != *":$HOME/.pyenv/bin:"* ]]; then
                eval -- "$(command pyenv init - bash)"
            else
                eval -- "$(command pyenv init --no-push-path - bash)"
            fi
            pyenv $@
        }
    fi
fi
