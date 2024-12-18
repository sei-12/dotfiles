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


		-- brew install lua-language-server
		lspconfig.lua_ls.setup{
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							'vim',
							'require'
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							vim.fn.expand "$VIMRUNTIME/lua",
							vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
							-- vim.fn.stdpath "data".."/lazy/ui/nvc"
							vim.fn.stdpath "data".."/lazy/lazy.nvim/lua/lazy",
							"${3rd}/luv/library",
							vim.api.nvim_get_runtime_file("", true),

						}
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},

			}
		}
			vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<CR>")
			vim.keymap.set("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
			vim.keymap.set("n", "gd",  "<cmd>Lspsaga goto_definition<CR>")
			-- vim.keymap.set("n", "gd",  "<cmd>Lspsaga goto_defnition<CR>")
	end

}
