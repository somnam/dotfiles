
# command history configuration
mkdir -p "${XDG_STATE_HOME:=$HOME/.local/state}/bash"
HISTFILE="$XDG_STATE_HOME/bash/bash_history"

# append to the history file, don't overwrite it
shopt -s histappend

# save multi-line commands as one command
shopt -s cmdhist

# re-edit the command line for failing history expansions
shopt -s histreedit

# re-edit the result of history expansions
shopt -s histverify

# save history with newlines instead of ; where possible
shopt -s lithist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# record each line as it gets issued
PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=25000
HISTFILESIZE=100000

# avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:ll:bg:fg:history:clear:cd:pwd"

# enable incremental history search with up/down arrows (also Readline goodness)
# learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-hi
bind '"\e[A": history-search-backward' 2>/dev/null
bind '"\e[B": history-search-forward' 2>/dev/null
bind '"\e[C": forward-char' 2>/dev/null
bind '"\e[D": backward-char' 2>/dev/null

# use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '
