if command -v brew &>/dev/null && [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi
