vim.cmd[[
  :se nohls
]]

require("lazy").setup({
    spec = {
		"tpope/vim-surround",
		"kana/vim-textobj-user",
		{
			'smoka7/hop.nvim',
			version = "*",
			opts = {
				keys = 'flisuetovxqpdygbzhckran'
			}
		},
    }
})

local keymap = vim.keymap
keymap.set("n", "s", ":HopWord<CR>")