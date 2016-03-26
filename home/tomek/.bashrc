# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load user-specific config.
config_files=(
    ~/.config/bashrc.d/sensible.bash \
    ~/.config/bashrc.d/bash.bash \
    ~/.config/bashrc.d/aliases.bash \
    ~/.config/bashrc.d/exports.bash
)
for file in ${config_files[@]}; do
    if [ -f "$file" ]; then . "$file"; fi
done

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
