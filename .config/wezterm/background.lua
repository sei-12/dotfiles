local wezterm = require 'wezterm'

local HOME = os.getenv("HOME")
local BG_IMGS_DIR = HOME..'/dotfiles/.config/wezterm/wallpapers/dist/'

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = directory..filename
    end
    pfile:close()
    return t
end


local background_images = scandir(BG_IMGS_DIR)


wezterm.on('window-config-reloaded', function(window, pane)
	if not window:get_config_overrides() then
		math.randomseed(os.time())
		local random_background = background_images[math.random(#background_images)]
		window:set_config_overrides {
			background = {
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
						File = random_background,
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
		}
	end
end)


return {}
