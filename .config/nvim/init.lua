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
		'nvim-telescope/telescope.nvim',
		"junegunn/vim-easy-align",
		'junegunn/fzf.vim',
		'junegunn/fzf',
		"nvim-lualine/lualine.nvim",
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
		"cohama/lexima.vim",
		"vim-scripts/vim-auto-save",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
		"glepnir/lspsaga.nvim",
	},
})


require('lualine').setup()
require('gitsigns').setup()
vim.opt.signcolumn = 'yes'
vim.opt.clipboard  = 'unnamedplus'

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- go
keymap.set("n", "<C-S-o>", ":Files<CR>")
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


vim.cmd[[
	let g:auto_save = 1
]]

vim.cmd[[
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
	nnoremap * *N
	nnoremap <C-f> :HopWord<CR>
]]

vim.api.nvim_create_user_command(
	'ReloadVim',
	function() vim.cmd("write") vim.cmd("luafile" .. vim.fn.expand('$MYVIMRC')) end,
	{desc = 'Save current file and source $MYVIMRC'}
)

local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]


