
--[[ require("lazy").setup({
	spec = {

		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				style = "night",
				transparent = true,
			},
		},
		{{ import = "plugins" }},
		{
			'smoka7/hop.nvim',
			version = "*",
			opts = {
				keys = 'flisuetovxqpdygbzhckran'
			}
		},
		"junegunn/vim-easy-align",
		"nvim-lualine/lualine.nvim",
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
		"cohama/lexima.vim",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
		,
	},
}) ]]

vim.opt.termguicolors  = true
vim.opt.wrap           = false
vim.opt.signcolumn     = 'yes'
vim.opt.clipboard      = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.number         = true
vim.opt.scrolloff      = 10
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.smartindent    = true
vim.opt.autoindent     = true
vim.opt.ignorecase     = true



vim.cmd('syntax enable')