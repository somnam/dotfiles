if [ -d ${HOME}/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval -- "$(command pyenv init --no-rehash -)"
fi
