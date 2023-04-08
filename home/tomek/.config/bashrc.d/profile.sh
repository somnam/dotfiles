BASH_THEME="git-prompt"

plugins=(
    brew
    cargo
    docker
    fzf
    git
    lua
    pyenv
    pyenv-python-version
    rg
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
