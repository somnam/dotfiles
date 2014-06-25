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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
alias apt-up='apt-get update && apt-get dist-upgrade && apt-get --purge autoremove && apt-get autoclean'
alias apt-clean='apt-get --purge autoremove && apt-get autoclean'

# Dev
alias xo='cd ~/workspace/Django/xo'

# Power management
# alias Suspend='xscreensaver-command -activate ; dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend';
# alias Hibernate='xscreensaver-command -activate ; dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate';
# alias Restart='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart';
# alias Stop='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop';
alias Suspend='xscreensaver-command -activate ; systemctl suspend';
alias Hibernate='xscreensaver-command -activate ; systemctl hibernate';
alias Restart='systemctl reboot';
alias Stop='systemctl poweroff'

