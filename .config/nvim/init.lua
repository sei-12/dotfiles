local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


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
		"tpope/vim-surround",
		{
			'smoka7/hop.nvim',
			version = "*",
			opts = {
				keys = 'flisuetovxqpdygbzhckran'
			}
		},
		-- 'nvim-telescope/telescope.nvim',
		"junegunn/vim-easy-align",
		"nvim-lualine/lualine.nvim",
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
		"cohama/lexima.vim",
		-- "vim-scripts/vim-auto-save",
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
		}
	},
})


require('lualine').setup()
require('gitsigns').setup()

vim.opt.signcolumn = 'yes'
vim.opt.clipboard  = 'unnamedplus'

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n","w","<C-w>")
keymap.set("n","wf",":Windows<CR>")


-- go
keymap.set("n", "<C-S-o>", ":Files<CR>")
keymap.set("n", "gl", ":HopLine<CR>")
keymap.set("n", "<C-f>", ":HopWord<CR>")

vim.opt.relativenumber = true
vim.opt.number         = true
vim.opt.scrolloff      = 10
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.smartindent    = true
vim.opt.autoindent     = true
vim.opt.ignorecase     = true

vim.cmd[[colorscheme tokyonight-storm]]
vim.cmd[[
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=NONE
]]
vim.cmd('syntax enable')


-- vim.cmd[[
-- let g:auto_save = 1
-- ]]

vim.cmd[[
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap * *N
nnoremap <C-f> :HopWord<CR>
]]

vim.api.nvim_create_user_command('ReloadVim',
function() vim.cmd("write") vim.cmd("luafile" .. vim.fn.expand('$MYVIMRC')) end,
{desc = 'Save current file and source $MYVIMRC'}
)


