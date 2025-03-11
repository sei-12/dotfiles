vim.opt.clipboard      = 'unnamedplus'
vim.opt.ignorecase     = true

if vim.g.vscode == nil then
    require "normal"
else
	require "vscode-conf"
end

require "lazy-nvim"
require "keymap"
require "expand_region"
