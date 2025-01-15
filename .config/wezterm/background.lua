local wezterm = require 'wezterm'

local HOME = os.getenv("HOME")
local BG_IMGS_DIR = HOME..'/dotfiles/.config/wezterm/wallpapers/dist/'
local SSH_IMGS_DIR = HOME..'/dotfiles/.config/wezterm/wallpapers/ssh_imgs/'

local function scandir(directory)
	local i, t, popen = 0, {}, io.popen
	local pfile = popen('ls "'..directory..'"')

	if pfile == nil then
		return {}
	end

	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

local function get_random_bg(imgs_dir)
	math.randomseed(os.time())
	local background_images = scandir(imgs_dir)
	local random_background = imgs_dir..background_images[math.random(#background_images)]
	return random_background
end

local BG_IMG = get_random_bg(BG_IMGS_DIR)

local function make_background_config(background_image)
	return {
		{
			source = {
				Gradient = {
					-- colors = { "#292e42", "#1f2335" },
					colors = { "#202334", "#202334" },
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
			width = '400px',
			height = '400px',
			opacity = 0.7,
			horizontal_align = 'Right',
			vertical_align = 'Bottom',
		}
	}
end


local function reload_bg(window)
		local overrides = window:get_config_overrides() or {}
		math.randomseed(os.time())
		local background_image = get_random_bg(BG_IMGS_DIR)
		wezterm.log_info("in reload_bg",background_image)
		overrides.background = make_background_config(background_image)
		window:set_config_overrides(overrides)
end

wezterm.on('user-var-changed', function(window, _, name, value)
	wezterm.log_info("user-var-changed!!")

	if not (name == "custom_background_events") then
		return
	end

	-- if value == "ssh_start" then
	-- 	local overrides = window:get_config_overrides() or {}
	-- 	local ssh_img = get_random_bg(SSH_IMGS_DIR)
	-- 	overrides.background = make_background_config(ssh_img)
	-- 	window:set_config_overrides(overrides)
	-- 	return
	-- end

	-- if value == "ssh_end" then
	-- 	reload_bg(window)
	-- 	return
	-- end


	if value == "initialize" then
		reload_bg(window)
		return
	end
end)


return make_background_config(BG_IMG)
