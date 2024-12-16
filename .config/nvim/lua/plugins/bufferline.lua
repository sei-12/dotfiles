return {
	'akinsho/bufferline.nvim',
	config = function()
		require("bufferline").setup({
			options = {
				indicator = { style = "icon", icon = ""},
				indicator_icon = nil,
			}
		})
	end
}
