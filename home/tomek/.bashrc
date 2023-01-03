# .bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [[ -d ~/.config/bashrc.d ]]; then
	for rc in ~/.config/bashrc.d/*; do
		[[ -f "$rc" ]] && source "$rc"
	done
fi

unset rc
