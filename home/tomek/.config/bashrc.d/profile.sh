BASH_THEME="git-prompt"

plugins=(
    brew
    docker
    fzf
    git
    pyenv
    pyenv-python-version
)

completions=(
    bash
    brew
)

aliases=(
    brew
    general
)

source "$HOME/.config/bashrc.d/main/main.sh"
