vim.cmd[[
  :se nohls
]]

require("lazy").setup({
    spec = {
		"tpope/vim-surround",
		"kana/vim-textobj-user",
    }
})