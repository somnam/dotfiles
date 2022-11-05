if [ -d ${HOME}/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
fi

if [[ -x ${PYENV_ROOT}/bin/pyenv ]]; then
    # Append Pyenv to path
    command -v pyenv >/dev/null || PATH="${PYENV_ROOT}/bin:${PATH}"

    # Initialize pyenv
    eval -- "$(pyenv init -)"
    eval -- "$(pyenv init --no-rehash -)"
fi
