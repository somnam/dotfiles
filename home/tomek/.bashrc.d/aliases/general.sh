# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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
