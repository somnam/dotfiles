if [[ -d "$HOME/.luarocks/bin" ]]; then
    # Add Lua to path
    if [[ ":$PATH:" != *":${HOME}/.luarocks/bin:"* ]]; then
        export PATH="${HOME}/.luarocks/bin${PATH:+:$PATH}"
    fi
fi
