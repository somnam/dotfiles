set_prompt_theme()
{
    local _exit=${?}
    local blank='\[\e[00m\]'
    local green='\[\e[0;32m\]'
    local lgreen='\[\e[1;32m\]'
    local lblue='\[\e[1;34m\]'
    local lred='\[\e[1;31m\]'

    local prompt="$"
    if [[ "${_exit}" -ne "0" ]]; then
        prompt="${lred}\$${blank}"
    fi

    local venv="${VIRTUAL_ENV_PROMPT:-}"

    local line_one="${venv}${lgreen}\u${green}@\h ${lblue}\w${blank} "
    local line_two="\n${prompt} "

    if [[ -n $(type -t __git_ps1) ]]; then
        __git_ps1 "${line_one}" "${line_two}" '[%s]'
    else
        PS1="${line_one}${line_two}"
    fi
}

if [[ ! "${PROMPT_COMMAND}" =~ set_prompt_theme ]]; then
    PROMPT_DIRTRIM=4
    PROMPT_COMMAND="set_prompt_theme${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi
