export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'
export GIT_PS1_SHOWCOLORHINTS='y'
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_DESCRIBE_STYLE='contains'


__git_ps1()
{
    local _exit=$?
    case "${#}" in
        2|3) PS1="${1}${2}" ;;
        *)	return ${_exit} ;;
    esac
}

source_git_prompt()
{
    local locations=(
        "/usr/share/git-core/contrib/completion/git-prompt.sh"
        "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
    )
    local git_prompt

    for git_prompt in ${locations[@]}; do
        if [[ -f "${git_prompt}" ]]; then
            source "${git_prompt}" > /dev/null
            break
        fi
    done

    unset -f source_git_prompt
}

source_git_prompt

