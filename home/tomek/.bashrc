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
