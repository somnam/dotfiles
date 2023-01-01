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

source "$HOME/.bashrc.d/main/main.sh"
