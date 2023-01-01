BASH_THEME="git-prompt"

plugins=(
    docker
    fzf
    git
    pyenv
)

completions=(
    bash
)

aliases=(
    general
)

source "$HOME/.config/bashrc.d/main/main.sh"
