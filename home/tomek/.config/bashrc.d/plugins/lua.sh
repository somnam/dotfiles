if [[ -d $HOME/.luarocks/bin ]]; then
    # Add Lua to path
    [[ ":$PATH:" != *":${HOME}/.luarocks/bin:"* ]] && PATH="${HOME}/.luarocks/bin:${PATH}"
fi
