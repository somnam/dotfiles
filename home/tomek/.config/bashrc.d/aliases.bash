# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Utils
alias c="clear"
alias g="gvim --remote-silent"
alias v="vim --remote-silent"
alias h="htop"
alias ack="ack-grep"
alias rscreen="screen -d -r"
alias bc="bc ~/.bcrc"
alias info="info --vi-keys"
alias sudo="sudo -E"
alias apt-up='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get --purge autoremove && sudo apt-get autoclean'
alias apt-clean='sudo apt-get --purge autoremove && sudo apt-get autoclean'
alias mpvf="mpv --sub-auto=fuzzy --monitorpixelaspect=1 --osd-scale=1 --sub-ass --sub-text-color=#ffffff --sub-text-shadow-color=#000000 --sub-text-border-color=#000000 --sub-text-border-size=2 --sub-text-shadow-offset=2.25 --sub-text-font-size=48 1>/dev/null 2>/dev/null"

# Power management
alias Suspend='systemctl suspend';
alias Hibernate='systemctl hibernate';
alias Restart='systemctl reboot';
alias Stop='systemctl poweroff'

