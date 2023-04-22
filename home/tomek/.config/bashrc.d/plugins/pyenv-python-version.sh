pyenv_python_version_hook()
{
    local retval=$?

    unset VIRTUAL_ENV;

    for venv in $(pyenv local 2>/dev/null); do
        if pyenv prefix "${venv}" 1>/dev/null 2>&1; then
            export VIRTUAL_ENV=$(pyenv prefix "${venv}");
            export PS1="(${venv}) ${PS1}"
            break
        fi
    done

    return $retval
}

if command -v pyenv >/dev/null; then
    if [[ ! "${PROMPT_COMMAND-}" =~ pyenv_python_version_hook ]]; then
      PROMPT_COMMAND="pyenv_python_version_hook;${PROMPT_COMMAND-}"
    fi
else
    unset -f pyenv_python_version_hook
fi
