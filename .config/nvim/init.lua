vim.opt.clipboard      = 'unnamedplus'
vim.keymap.set("n","*","*N")


-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
-- 	vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--filter=blob:none",
-- 		"https://github.com/folke/lazy.nvim.git",
-- 		"--branch=stable", -- latest stable release
-- 		lazypath,
-- 	})
-- end
-- vim.opt.rtp:prepend(lazypath)


-- require("lazy").setup({
-- 	spec = {

-- 		{
-- 			"folke/tokyonight.nvim",
-- 			lazy = false,
-- 			priority = 1000,
-- 			opts = {
-- 				style = "night",
-- 				transparent = true,
-- 			},
-- 		},
-- 		{{ import = "plugins" }},
-- 		"tpope/vim-surround",
-- 		{
-- 			'smoka7/hop.nvim',
-- 			version = "*",
-- 			opts = {
-- 				keys = 'flisuetovxqpdygbzhckran'
-- 			}
-- 		},
-- 		"junegunn/vim-easy-align",
-- 		"nvim-lualine/lualine.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"lewis6991/gitsigns.nvim",
-- 		"cohama/lexima.vim",
-- 		"L3MON4D3/LuaSnip",
-- 		"onsails/lspkind-nvim",
-- 		{
-- 			'nvimdev/lspsaga.nvim',
-- 			config = function()
-- 				require('lspsaga').setup({
-- 					border_style = "single"
-- 				})
-- 			end,
-- 			dependencies = {
-- 				'nvim-treesitter/nvim-treesitter', -- optional
-- 				'nvim-tree/nvim-web-devicons',     -- optional
-- 			}
-- 		},
-- 		"tpope/vim-repeat",
-- 		"kana/vim-textobj-user",
-- 		{
-- 			"osyo-manga/vim-textobj-multiblock",
-- 			dependencies = {
-- 				"kana/vim-textobj-user"
-- 			}
-- 		},
-- 	},
-- })


-- require('lualine').setup {}
-- require('gitsigns').setup {}



-- require "text-obj-user"
-- require "bufferline-color"

-- local keymap = vim.keymap


-- -- 使わないキー
-- -- w (used)
-- -- s (used)
-- -- m (used)
-- -- e
-- -- z
-- -- b

-- -- レギュラーメンバー
-- keymap.set("n","w","<C-w>")
-- keymap.set("n","ga","<Plug>(EasyAlign)")
-- keymap.set("x","ga","<Plug>(EasyAlign)")

-- -- 試験的
-- keymap.set("n","m","%")
-- keymap.set("v","m","%")
-- keymap.set("n", "<Enter>", ":Files<CR>")

-- -- multiblock の m　
-- keymap.set("o","am","<Plug>(textobj-multiblock-a)")
-- keymap.set("o","im","<Plug>(textobj-multiblock-i)")
-- keymap.set("x","am","<Plug>(textobj-multiblock-a)")
-- keymap.set("x","im","<Plug>(textobj-multiblock-i)")

-- keymap.set("n", "<C-CR>", ":vs<CR>")
-- keymap.set("n", "<C-S-o>", ":Files<CR>")
-- keymap.set("n", "s", ":HopWord<CR>")
-- keymap.set("i","<C-j>","<ESC>")
-- keymap.set("n","*","*N")


-- -- 疑問視
-- -- keymap.set("n", "<C-f>", ":HopWord<CR>")
-- -- keymap.set("n", "gl", ":HopLine<CR>")




-- vim.opt.termguicolors  = true
-- vim.opt.wrap         = false
-- -- vim.opt.textwidth = 0
-- -- vim.opt.wrapmargin = 0

-- vim.opt.signcolumn     = 'yes'
-- vim.opt.clipboard      = 'unnamedplus'
-- vim.opt.relativenumber = true
-- vim.opt.number         = true
-- vim.opt.scrolloff      = 10
-- vim.opt.tabstop        = 4
-- vim.opt.shiftwidth     = 4
-- vim.opt.smartindent    = true
-- vim.opt.autoindent     = true
-- vim.opt.ignorecase     = true

-- vim.cmd[[colorscheme tokyonight-storm]]

-- -- なんの設定だったか忘れた。
-- -- vim.cmd[[
-- -- highlight VertSplit ctermbg=NONE
-- -- highlight VertSplit ctermfg=NONE
-- -- ]]
-- --
-- --
-- --

-- vim.cmd('syntax enable')

-- vim.api.nvim_create_user_command('ReloadVim',
-- 	function() vim.cmd("write") vim.cmd("luafile" .. vim.fn.expand('$MYVIMRC')) end,
-- 	{desc = 'Save current file and source $MYVIMRC'}
-- )



