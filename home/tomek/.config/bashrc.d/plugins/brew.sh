if [[ -f /opt/homebrew/bin/brew ]] ; then
    # Enable brew
    [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d /opt/homebrew/opt/openjdk/bin ]; then
    if [[ ":$PATH:" != *":/opt/homebrew/opt/openjdk/bin:"* ]]; then
        export PATH="/opt/homebrew/opt/openjdk/bin${PATH:+:$PATH}"
    fi
fi

if [ -d /opt/homebrew/opt/libpq/bin ]; then
    if [[ ":$PATH:" != *":/opt/homebrew/opt/libpq/bin:"* ]]; then
        export PATH="/opt/homebrew/opt/libpq/bin${PATH:+:$PATH}"
    fi
fi
