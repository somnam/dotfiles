local wezterm_local = require "wezterm_local"

local config = {
    audible_bell = "Disabled",
    bold_brightens_ansi_colors = true,
    color_scheme = nil,
    cursor_blink_rate = 0,
    enable_scroll_bar = false,
    font = nil,
    font_size = 12.0,
    hide_mouse_cursor_when_typing = true,
    hide_tab_bar_if_only_one_tab = true,
    native_macos_fullscreen_mode = true,
    scrollback_lines = 20000,
    use_fancy_tab_bar = false,
    window_padding = {left = 4, right = 4, top = 2, bottom = 2},
}

for key, value in pairs(wezterm_local) do
    config[key] = value
end

return config
