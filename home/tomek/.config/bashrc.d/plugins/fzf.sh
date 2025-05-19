if [[ -d "$HOME/.fzf" ]]; then
    if [[ ":$PATH:" != *":$HOME/.fzf/bin:"* ]]; then
        export PATH="$HOME/.fzf/bin${PATH:+:$PATH}"
    fi
fi

setup_fzf()
{
    # Key bindings
    local locations=(
        "/usr/share/fzf/shell/key-bindings.bash"
        "$HOME/.fzf/shell/key-bindings.bash"
    )
    for key_bindings in ${locations[@]}; do
        if [[ -f "${key_bindings}" ]]; then
            source "${key_bindings}" > /dev/null
            break
        fi
    done

    # Setting fd as the default source for fzf
    if command -v fd > /dev/null; then
        export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --no-require-git --exclude .git"
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi

    unset -f setup_fzf
}

if command -v fzf > /dev/null; then
    setup_fzf
fi
