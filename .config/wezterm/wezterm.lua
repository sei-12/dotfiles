local wezterm = require 'wezterm'
local tab = require "tab"
local config = {}

config.font = wezterm.font_with_fallback {
	{ family = 'Hack Nerd Font', weight = 'Bold', italic = false },
    { family = 'ヒラギノ角ゴシック', weight = 'Medium' }
}

config.font_size = 15
config.use_ime = true


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

local act = wezterm.action

config.background = require "background"


config.keys = {
	{
		key = "¥",
		action = wezterm.action.SendKey { key = '\\' }
	},
	{ 
		key = "q", 
		mods = "CTRL",
		action = act.ActivateCopyMode 
	},
}

config.window_decorations = "RESIZE"
config.color_scheme = 'Tokyo Night Storm'
config.colors = {
	tab_bar = {
		background = 'rgba(0,0,0,0)'
    }
}

tab.setup(config)

return config
