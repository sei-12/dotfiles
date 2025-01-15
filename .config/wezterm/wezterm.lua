local wezterm = require 'wezterm'
local tab = require "tab"
local config = {}

config.font = wezterm.font('Hack Nerd Font', { weight = 'Bold', italic = false })
config.font_size = 15
config.use_ime = true
config.hide_tab_bar_if_only_one_tab = true


config.window_background_opacity = 0.90
config.macos_window_background_blur = 2

config.initial_rows = 36
config.initial_cols = 133

config.window_padding = {
	left   = 55,
	right  = 55,
	top    = 10,
	bottom = 20,
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


tab.setup(config)

return config
