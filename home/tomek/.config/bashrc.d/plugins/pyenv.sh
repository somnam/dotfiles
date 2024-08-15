if [ -d ${HOME}/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    if [[ ":$PATH:" != *":$HOME/.pyenv/bin:"* ]]; then
        eval -- "$(command pyenv init --no-rehash -)"
    else
        eval -- "$(command pyenv init --no-push-path --no-rehash -)"
    fi
fi
