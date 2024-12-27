
require("lazy").setup({
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
		{
			'nvimdev/lspsaga.nvim',
			config = function()
				require('lspsaga').setup({
					border_style = "single"
				})
			end,
			dependencies = {
				'nvim-treesitter/nvim-treesitter', -- optional
				'nvim-tree/nvim-web-devicons',     -- optional
			}
		},
		"tpope/vim-repeat",
		"kana/vim-textobj-user",
		{
			"osyo-manga/vim-textobj-multiblock",
			dependencies = {
				"kana/vim-textobj-user"
			}
		},
	},
})


require('lualine').setup {}
require('gitsigns').setup {}



require "text-obj-user"
require "bufferline-color"

local keymap = vim.keymap


-- 使わないキー
-- w (used)
-- s (used)
-- m (used)
-- e
-- z
-- b

-- レギュラーメンバー
keymap.set("n","w","<C-w>")
keymap.set("n","ga","<Plug>(EasyAlign)")
keymap.set("x","ga","<Plug>(EasyAlign)")
keymap.set("n","*","*N")
keymap.set("v","*","*N")

-- 試験的
keymap.set("n","m","%")
keymap.set("v","m","%")
keymap.set("n", "<Enter>", ":Files<CR>")
keymap.set("n","q","ql")
keymap.set("n","@","@l")

keymap.set("n","H","^")
keymap.set("n","L","$")
keymap.set("v","H","^")
keymap.set("v","L","$")

-- multiblock の m　
keymap.set("o","am","<Plug>(textobj-multiblock-a)")
keymap.set("o","im","<Plug>(textobj-multiblock-i)")
keymap.set("x","am","<Plug>(textobj-multiblock-a)")
keymap.set("x","im","<Plug>(textobj-multiblock-i)")

keymap.set("n", "<C-CR>", ":vs<CR>")
keymap.set("n", "<C-S-o>", ":Files<CR>")
keymap.set("n", "s", ":HopWord<CR>")
keymap.set("i","<C-j>","<ESC>")




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

vim.cmd[[colorscheme tokyonight-storm]]


vim.cmd('syntax enable')

vim.api.nvim_create_user_command('ReloadVim',
	function() vim.cmd("write") vim.cmd("luafile" .. vim.fn.expand('$MYVIMRC')) end,
	{desc = 'Save current file and source $MYVIMRC'}
)



