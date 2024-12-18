local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('Hack Nerd Font', { weight = 'Bold', italic = false })
config.font_size = 15
config.use_ime = true
config.hide_tab_bar_if_only_one_tab = true


config.window_background_opacity = 0.90
config.macos_window_background_blur = 15

config.initial_rows = 36
config.initial_cols = 133

config.window_padding = {
	left   = 40,
	right  = 40,
	top    = 30,
	bottom = 30,
}



config.background = require "background"

config.keys = {
	{
		key = "¥",
		action = wezterm.action.SendKey { key = '\\' }
	},
}

config.window_decorations = "RESIZE"
config.color_scheme = 'Tokyo Night Storm'


return config
