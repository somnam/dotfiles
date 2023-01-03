# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if command ls --color -d . > /dev/null; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

if [[ $(echo | grep --color=auto "" > /dev/null 2>&1) -ne "0" ]]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if command -v ack > /dev/null 2>&1; then
    alias ack-python='ack --python --ignore-dir={.env,.venv}'
fi

alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -p'

alias less='less -FSRXc'
alias info='info --vi-keys'
alias wget='wget -c'
alias sudo='sudo -E'

alias pie='perl -p -i -e 2>/dev/null'
