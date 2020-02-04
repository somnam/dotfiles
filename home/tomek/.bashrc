# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load user-specific config.
load-user-config-files ()
{
    local config_path="$HOME/.config/bashrc.d"
    [[ -d $config_path ]] || return

    for file in "${config_path}"/*.bash; do
        [[ -f "$file" ]] && . "$file"
    done
}


load-user-config-files
