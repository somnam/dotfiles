BASH_THEME="git-prompt"

plugins=(
    brew
    cargo
    colima
    docker
    fzf
    git
    lua
    nvim
    nvm
    pyenv
    pyenv-python-version
    rg
)

completions=(
    bash
    brew
    cargo
)

aliases=(
    brew
    general
)

source "$HOME/.config/bashrc.d/main/main.sh"
