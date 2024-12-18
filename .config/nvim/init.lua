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
		},
	},
})


require('lualine').setup()
require('gitsigns').setup()

vim.opt.termguicolors = true


vim.opt.signcolumn = 'yes'
vim.opt.clipboard  = 'unnamedplus'

local keymap = vim.keymap
local opts = { noremap = true, silent = true }



-- 使わないキー
-- w (used)
-- s (used)
-- m
-- e
-- z
-- b

-- レギュラーメンバー
keymap.set("n","w","<C-w>")

-- 試験的
keymap.set("n", "<C-S-o>", ":Files<CR>")
keymap.set("n", "s", ":HopWord<CR>")
keymap.set("i","<C-j>","<ESC>")


-- 疑問視
keymap.set("n", "<C-f>", ":HopWord<CR>")
keymap.set("n", "gl", ":HopLine<CR>")




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
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap * *N
nnoremap <C-f> :HopWord<CR>
]]

vim.api.nvim_create_user_command('ReloadVim',
function() vim.cmd("write") vim.cmd("luafile" .. vim.fn.expand('$MYVIMRC')) end,
{desc = 'Save current file and source $MYVIMRC'}
)



vim.cmd[[
hi BufferLineBackground guibg=NONE
hi BufferLineBuffer guibg=NONE
hi BufferLineBufferSelected guibg=NONE
hi BufferLineBufferVisible guibg=NONE
hi BufferLineCloseButton guibg=NONE
hi BufferLineCloseButtonSelected guibg=NONE
hi BufferLineCloseButtonVisible guibg=NONE
hi BufferLineDevIconDefault guibg=NONE
hi BufferLineDevIconLuaSelected guibg=NONE
hi BufferLineDiagnostic guibg=NONE
hi BufferLineDiagnosticSelected guibg=NONE
hi BufferLineDiagnosticVisible guibg=NONE
hi BufferLineDuplicate guibg=NONE
hi BufferLineDuplicateSelected guibg=NONE
hi BufferLineDuplicateVisible guibg=NONE
hi BufferLineError guibg=NONE
hi BufferLineErrorDiagnostic guibg=NONE
hi BufferLineErrorDiagnosticSelected guibg=NONE
hi BufferLineErrorDiagnosticVisible guibg=NONE
hi BufferLineErrorSelected guibg=NONE
hi BufferLineErrorVisible guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineGroupLabel guibg=NONE
hi BufferLineGroupSeparator guibg=NONE
hi BufferLineHint guibg=NONE
hi BufferLineHintDiagnostic guibg=NONE
hi BufferLineHintDiagnosticSelected guibg=NONE
hi BufferLineHintDiagnosticVisible guibg=NONE
hi BufferLineHintSelected guibg=NONE
hi BufferLineHintVisible guibg=NONE
hi BufferLineIndicatorSelected guibg=NONE
hi BufferLineIndicatorVisible guibg=NONE
hi BufferLineInfo guibg=NONE
hi BufferLineInfoDiagnostic guibg=NONE
hi BufferLineInfoDiagnosticSelected guibg=NONE
hi BufferLineInfoDiagnosticVisible guibg=NONE
hi BufferLineInfoSelected guibg=NONE
hi BufferLineInfoVisible guibg=NONE
hi BufferLineModified guibg=NONE
hi BufferLineModifiedSelected guibg=NONE
hi BufferLineModifiedVisible guibg=NONE
hi BufferLineNumbers guibg=NONE
hi BufferLineNumbersSelected guibg=NONE
hi BufferLineNumbersVisible guibg=NONE
hi BufferLineOffsetSeparator guibg=NONE
hi BufferLinePick guibg=NONE
hi BufferLinePickSelected guibg=NONE
hi BufferLinePickVisible guibg=NONE
hi BufferLineSeparator guibg=NONE
hi BufferLineSeparatorSelected guibg=NONE
hi BufferLineSeparatorVisible guibg=NONE
hi BufferLineTab guibg=NONE
hi BufferLineTabClose guibg=NONE

hi BufferLineTabSelected guibg=NONE
hi BufferLineTabSeparator guibg=NONE
hi BufferLineTabSeparator guifg=NONE

hi BufferLineTabSeparatorSelected guibg=NONE
hi BufferLineTruncMarker guibg=NONE
hi BufferLineWarning guibg=NONE
hi BufferLineWarningDiagnostic guibg=NONE
hi BufferLineWarningDiagnosticSelected guibg=NONE
hi BufferLineWarningDiagnosticVisible guibg=NONE
hi BufferLineWarningSelected guibg=NONE
hi BufferLineWarningVisible guibg=NONE
hi BufferLineHint guibg=NONE
]]
