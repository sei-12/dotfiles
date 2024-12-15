return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.pyright.setup{}
		lspconfig.rust_analyzer.setup {
		  -- Server-specific settings. See `:help lspconfig-setup`
		  settings = {
			['rust-analyzer'] = {},
		  },
		}

		lspconfig.ts_ls.setup {
		  on_attach = on_attach,
		  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		  cmd = { "typescript-language-server", "--stdio" }
		}

		vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>")
		vim.keymap.set("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
	end
	
}
