pyenv_python_version_hook()
{
    local retval=$?

    if [[ -n "${VIRTUAL_ENV:-}" && "${PYENV_VIRTUAL_ENV:-}" != "${VIRTUAL_ENV}" ]]; then
        unset -v PYENV_VIRTUAL_ENV
        return $retval
    fi

    unset -v VIRTUAL_ENV PYENV_VIRTUAL_ENV VIRTUAL_ENV_PROMPT

    for venv in $(pyenv local 2>/dev/null); do
        local venv_path=$(pyenv prefix "${venv}" 2>/dev/null)
        if [[ -n ${venv_path} ]]; then
            export VIRTUAL_ENV=${venv_path};
            export PYENV_VIRTUAL_ENV=${VIRTUAL_ENV}
            export VIRTUAL_ENV_PROMPT="(${venv}) "
            break
        fi
    done

    return $retval
}

if command -v pyenv >/dev/null; then
    if [[ ! "${PROMPT_COMMAND-}" =~ pyenv_python_version_hook ]]; then
        PROMPT_COMMAND="${PROMPT_COMMAND:-} pyenv_python_version_hook;"
    fi
else
    unset -f pyenv_python_version_hook
fi
