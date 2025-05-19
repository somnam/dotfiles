# Auto-completion
if [[ -f "$HOME/.fzf/shell/completion.bash" ]]; then
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null
fi
