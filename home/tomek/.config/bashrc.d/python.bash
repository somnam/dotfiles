export PYTHONSTARTUP=$HOME/.pystartup

if [ -d ${HOME}/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
fi

if [ -x ${PYENV_ROOT}/bin/pyenv ]; then
    if [[ ":$PATH:" != *":${PYENV_ROOT}/bin:"* ]]; then
        # Append Pyenv to path
        PATH="${PYENV_ROOT}/bin:${PATH}"
        source "${PYENV_ROOT}/completions/pyenv.bash"

        # Initialize pyenv
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
fi
