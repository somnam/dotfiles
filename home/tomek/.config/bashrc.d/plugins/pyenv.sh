if [ -d ${HOME}/.pyenv ]; then
    # Lazy load pyenv
    function pyenv() {
        unset -f pyenv
        export PYENV_ROOT=$HOME/.pyenv
        export PATH="${PYENV_ROOT}/bin:${PATH}"
        eval "$(command pyenv init -)"
        pyenv "$@"
    }
fi
