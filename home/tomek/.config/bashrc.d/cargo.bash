if [ -d ${HOME}/.cargo/bin ]; then
    # Add Rust to path
    [[ ":$PATH:" != *":${HOME}/.cargo/bin:"* ]] && PATH="${HOME}/.cargo/bin:${PATH}"
fi

