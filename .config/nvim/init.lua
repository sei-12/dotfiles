vim.opt.clipboard      = 'unnamedplus'

if vim.g.vscode == nil then
    require "normal"
else
	require "vscode-conf"
end

require "lazy-nvim"
require "keymap"