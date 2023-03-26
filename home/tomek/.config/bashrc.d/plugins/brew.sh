if [[ -f /opt/homebrew/bin/brew ]] ; then
    # Enable brew
    [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi
