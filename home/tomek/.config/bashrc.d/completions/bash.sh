# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on" 2>/dev/null

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on" 2>/dev/null

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on" 2>/dev/null

# Print all possible completions after the first Tab press
bind 'set show-all-if-ambiguous on'

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar 2> /dev/null

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
