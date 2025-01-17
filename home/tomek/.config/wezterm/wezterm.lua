local wezterm = require("wezterm")
local wezterm_local = require("wezterm_local")

local config = {
	audible_bell = "Disabled",
	bold_brightens_ansi_colors = true,
	cursor_blink_rate = 0,
	enable_scroll_bar = false,
	font = wezterm.font("JetBrains Mono Regular"),
	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font("JetBrains Mono Bold"),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("JetBrains Mono Bold Italic"),
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font("JetBrains Mono Italic"),
		},
	},
	hide_mouse_cursor_when_typing = true,
	hide_tab_bar_if_only_one_tab = true,
	native_macos_fullscreen_mode = true,
	scrollback_lines = 20000,
	use_fancy_tab_bar = false,
	window_padding = { left = 4, right = 4, top = 2, bottom = 2 },
}

for key, value in pairs(wezterm_local or {}) do
	config[key] = value
end

return config
