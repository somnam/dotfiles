BASH_THEME="git-prompt"

completions=(
    bash
)

aliases=(
    general
)

plugins=(
    docker
    fzf
    git
    pyenv
)

source "$HOME/.bashrc.d/main/main.sh"
