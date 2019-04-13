# Editor
export EDITOR='vim'

# Git
export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWSTASHSTATE='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'
export GIT_PS1_DESCRIBE_STYLE='contains'
export GIT_PS1_SHOWUPSTREAM='auto'

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=3

# Python
export PYTHONSTARTUP=$HOME/.pystartup

# Append Pyenv to path
[[ ":$PATH:" != *":${HOME}/.pyenv/bin:"* ]] && PATH="${HOME}/.pyenv/bin:${PATH}"

# Initialize pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
