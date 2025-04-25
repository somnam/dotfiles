python_venv_hook()
{
    local retval=$?

    local venv_dir
    if [[ -d ./.venv ]]; then
        venv_dir=".venv"
    elif [[ -d ./venv ]]; then
        venv_dir="venv"
    elif [[ -d ./.env ]]; then
        venv_dir=".env"
    fi

    if [[ ! ${venv_dir} ]]; then
        if [[ -n "$VIRTUAL_ENV" ]] && type deactivate &>/dev/null; then
            deactivate
        fi
        return $retval
    fi

    if [[ "$VIRTUAL_ENV" == "$(pwd)/$venv_dir" ]]; then
        return $retval
    fi

    if [[ -n "$VIRTUAL_ENV" ]] && type deactivate &>/dev/null; then
        deactivate
    fi

    if [[ -f "$venv_dir/bin/activate" ]]; then
        source "$venv_dir/bin/activate"
    fi

    return $retval
}

if [[ ! "${PROMPT_COMMAND-}" =~ python_venv_hook ]]; then
    PROMPT_COMMAND="python_venv_hook${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi
