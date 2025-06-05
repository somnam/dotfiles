pyenv_python_version_hook()
{
    local retval=$?

    if [[ -n "${VIRTUAL_ENV:-}" && "${PYENV_VIRTUAL_ENV:-}" != "${VIRTUAL_ENV}" ]]; then
        unset -v PYENV_VIRTUAL_ENV
        return $retval
    fi

    unset -v VIRTUAL_ENV PYENV_VIRTUAL_ENV VIRTUAL_ENV_PROMPT

    local pyenv_version_file=${PYENV_ROOT}/libexec/pyenv-version-file
    if [[ ! -f ${pyenv_version_file} ]]; then
        return $retval
    fi

    local version_file="$(${pyenv_version_file} "$PWD")"
    if [[ ! ${version_file} ]]; then
        return $retval
    fi

    local venv="$(head -n 1 ${version_file})"
    if [[ ! ${venv} ]]; then
        return $retval
    fi

    local venv_path=${PYENV_ROOT}/versions/${venv}
    if [[ -n ${venv_path} ]]; then
        export VIRTUAL_ENV=${venv_path};
        export PYENV_VIRTUAL_ENV=${VIRTUAL_ENV}
        export VIRTUAL_ENV_PROMPT="${venv}"
    fi

    return $retval
}

if command -v pyenv >/dev/null; then
    if [[ ! "${PROMPT_COMMAND-}" =~ pyenv_python_version_hook ]]; then
        PROMPT_COMMAND="pyenv_python_version_hook${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
    fi
else
    unset -f pyenv_python_version_hook
fi
