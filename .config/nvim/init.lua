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
    "tpope/vim-surround",
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {
	      style = "night",
	      transparent     = true, 
	      terminal_colors = true,
      },
    },
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
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "lewis6991/gitsigns.nvim",
    "cohama/lexima.vim",
})

require('lualine').setup()
require('gitsigns').setup()vim.opt.clipboard      = 'unnamedplus'

vim.opt.relativenumber = true
vim.opt.scrolloff      = 10
-- indent
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.smartindent    = true
vim.opt.autoindent     = true
vim.opt.ignorecase     = true

vim.cmd('syntax enable')
vim.cmd[[colorscheme tokyonight-storm]]

vim.cmd[[
    nmap <C-S-o> :Files<CR>
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


