BASH_THEME="default"

plugins=(
    cargo
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
    cargo
)

aliases=(
    general
)

source "$HOME/.config/bashrc.d/main/main.sh"
