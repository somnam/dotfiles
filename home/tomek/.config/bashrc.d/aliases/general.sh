# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if command -v fd >/dev/null; then
    alias fd='fd --hidden'
fi

if command ls --group-directories-first /dev/null >/dev/null; then
    alias ll='ls -ahlF --group-directories-first'
else
    alias ll='ls -ahlF'
fi
alias la='ls -A'
alias l='ls -CF'

alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -p'

alias less='less -RXc'
alias info='info --vi-keys'
alias wget='wget -c'
alias sudo='sudo -E'

alias pie='perl -p -i -e 2>/dev/null'
