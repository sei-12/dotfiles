local wezterm = require 'wezterm'

local HOME = os.getenv("HOME")
local BG_IMGS_DIR = HOME..'/dotfiles/.config/wezterm/wallpapers/dist/'
local SSH_IMGS_DIR = HOME..'/dotfiles/.config/wezterm/wallpapers/ssh_imgs/'

function scandir(directory)
	local i, t, popen = 0, {}, io.popen
	local pfile = popen('ls "'..directory..'"')
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

function get_random_bg(imgs_dir)
	math.randomseed(os.time())
	local background_images = scandir(imgs_dir)
	local random_background = imgs_dir..background_images[math.random(#background_images)]
	return random_background
end

local BG_IMG = get_random_bg(BG_IMGS_DIR)

function make_background_config(background_image)
	return {
		{
			source = {
				Gradient = {
					colors = { "#292e42", "#1f2335" },
					orientation = {
						Linear = { angle = -30.0 },
					},
				},
			},
			opacity = 0.9,
			width = "100%",
			height = "100%",
		},
		{
			source = {
				File = background_image,
			},
			repeat_x = 'NoRepeat',
			repeat_y = "NoRepeat",
			horizontal_align = 'Right',
			vertical_align = 'Bottom',
			width = '400px',
			height = '400px',
			opacity = 0.5,
			horizontal_align = 'Right',
			vertical_align = 'Bottom',
		}
	}
end


function reload_bg(window,pane)
		local overrides = window:get_config_overrides() or {}
		math.randomseed(os.time())
		local background_image = get_random_bg(BG_IMGS_DIR)
		wezterm.log_info("in reload_bg",background_image)
		overrides.background = make_background_config(background_image)
		window:set_config_overrides(overrides)
		return
end

wezterm.on('user-var-changed', function(window, pane, name, value)
	wezterm.log_info("user-var-changed!!")

	if not (name == "custom_background_events") then
		return
	end

	if value == "ssh_start" then
		local overrides = window:get_config_overrides() or {}
		local ssh_img = get_random_bg(SSH_IMGS_DIR)
		overrides.background = make_background_config(ssh_img)
		window:set_config_overrides(overrides)
		return
	end

	if value == "ssh_end" then
		reload_bg(window,pane)
		return
	end


	if value == "initialize" then
		reload_bg(window,pane)
		return
	end
end)


return make_background_config(BG_IMG)
