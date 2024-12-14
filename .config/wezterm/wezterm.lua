local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('Hack Nerd Font', { weight = 'Bold', italic = false })
config.font_size = 15
config.use_ime = true
config.hide_tab_bar_if_only_one_tab = true


config.window_background_opacity = 0.9
config.macos_window_background_blur = 0

config.window_padding = {
  left = 30,
  right = 30,
  top = 30,
  bottom = 30,
}

config.window_decorations = "RESIZE"
config.color_scheme = 'Tokyo Night Storm'

return config
