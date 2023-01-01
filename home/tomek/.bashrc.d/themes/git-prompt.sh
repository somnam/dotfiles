set_prompt_theme()
{
    local _exit=${?}
    local blank='\[\e[00m\]'
    local green='\[\e[0;32m\]'
    local lgreen='\[\e[1;32m\]'
    local lyellow='\[\e[1;33m\]'
    local lblue='\[\e[1;34m\]'
    local lred='\[\e[1;31m\]'

    local sign="➜"
    if [[ "${_exit}" -ne "0" ]]; then
        sign="${lred}➜${blank}"
    fi

    __git_ps1 "${lgreen}\u${green}@\h ${lblue}\w${blank} " "\n${sign} " '[%s]'
}

if [[ ! "${PROMPT_COMMAND}" =~ set_prompt_theme ]]; then
    PROMPT_DIRTRIM=4
    PROMPT_COMMAND="set_prompt_theme;${PROMPT_COMMAND}"
fi
