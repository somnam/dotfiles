if [[ -d "${HOME}/.cargo/bin" ]]; then
    if [[ ":$PATH:" != *":${HOME}/.cargo/bin:"* ]]; then
        export PATH="${HOME}/.cargo/bin${PATH:+:$PATH}"
    fi
fi

