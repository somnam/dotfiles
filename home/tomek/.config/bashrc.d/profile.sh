BASH_THEME="default"

plugins=(
    brew
    cargo
    colima
    docker
    fzf
    git
    lua
    nvim
    fnm
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
