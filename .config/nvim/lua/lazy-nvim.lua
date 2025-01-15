local spec = {
    -- https://github.com/michaeljsmith/vim-indent-object
    "michaeljsmith/vim-indent-object",

    "tpope/vim-surround",
	"tpope/vim-repeat",
    "kana/vim-textobj-user",
    {
        "rbtnn/vim-textobj-string",
        dependencies = {
            "kana/vim-textobj-user"
        }
    },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'flisuetovxqpdygbzhckran'
        }
    },
}

if vim.g.vscode == nil then
    spec[#spec + 1] = {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            transparent = true,
        },
    }

    spec[#spec + 1] = {{ import = "plugins" }}

    spec[#spec + 1] = "junegunn/vim-easy-align"
    spec[#spec + 1] = "nvim-lualine/lualine.nvim"
    spec[#spec + 1] = "nvim-tree/nvim-web-devicons"
    spec[#spec + 1] = "lewis6991/gitsigns.nvim"
    spec[#spec + 1] = "cohama/lexima.vim"
    spec[#spec + 1] = "L3MON4D3/LuaSnip"
    spec[#spec + 1] = "onsails/lspkind-nvim"
    spec[#spec + 1] = {
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
end

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
    spec = spec
})

require "text-obj-user"

if vim.g.vscode == nil then
    vim.cmd[[colorscheme tokyonight-storm]]
    require('lualine').setup {}
    require('gitsigns').setup {}
    require "bufferline-color"
end