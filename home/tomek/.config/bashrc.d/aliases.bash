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

# some more ls aliases
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

# Utils
alias c="clear"
alias bc="bc ~/.bcrc"
alias info="info --vi-keys"
alias apt-up='sudo apt update && sudo apt full-upgrade && sudo apt autoremove --purge && sudo apt autoclean'
alias apt-clean='sudo apt autoremove --purge && sudo apt autoclean'
alias swapr='sync && sudo /sbin/sysctl vm.drop_caches=3 && sudo swapoff -a && sudo swapon -a'

# Power management
alias Suspend='systemctl suspend';
alias Hibernate='systemctl hibernate';
alias Restart='systemctl reboot';
alias Stop='systemctl poweroff'
