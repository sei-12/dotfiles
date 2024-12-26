vim.cmd[[
  :se nohls
]]

require("lazy").setup({
    spec = {
		"tpope/vim-surround",
		-- "kana/vim-textobj-user",
		{
			'smoka7/hop.nvim',
			version = "*",
			opts = {
				keys = 'flisuetovxqpdygbzhckran'
			}
		},
    }
})

local vscode = require('vscode')
local keymap = vim.keymap

keymap.set("n", "s", ":HopWord<CR>")
keymap.set("n","*","*N")

keymap.set("n", ":",function()
	vscode.call("workbench.action.showCommands")
end)


keymap.set("n","<C-w><S-c>",function()
	vscode.call("workbench.action.closeAllEditors")
	vscode.call("workbench.action.quickOpen")
end)

keymap.set("n","<C-w>c",function()
	vscode.call("workbench.action.closeEditorsAndGroup")
end)

keymap.set("n","ga",function()
	vscode.call("codealignment.alignbyregex")
end)
keymap.set("x","ga",function()
	vscode.call("codealignment.alignbyregex")
end)
