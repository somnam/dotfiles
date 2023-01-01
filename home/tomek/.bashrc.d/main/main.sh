source-rc-files()
{
    local rc_path="$HOME/.bashrc.d"
    local rc_file

    # shell
    for rc_file in $rc_path/shell/*.sh; do
        source "$rc_file"
    done

    # plugins
    for plugin in ${plugins[@]}; do
        rc_file="$rc_path/plugins/${plugin}.sh"
        [[ -f "$rc_file" ]] && source "$rc_file"
    done

    # completions
    for completion in ${completions[@]}; do
        rc_file="$rc_path/completions/${completion}.sh"
        [[ -f "$rc_file" ]] && source "$rc_file"
    done

    # aliases
    for alias in ${aliases[@]}; do
        rc_file="$rc_path/aliases/${alias}.sh"
        [[ -f "$rc_file" ]] && source "$rc_file"
    done

    # theme
    rc_file="$rc_path/themes/${BASH_THEME}.sh"
    [[ -f "$rc_file" ]] && source "$rc_file"

    unset -v completions aliases plugins BASH_THEME
    unset -f source-rc-files
}

source-rc-files

