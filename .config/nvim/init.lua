vim.opt.clipboard      = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.scrolloff      = 10

-- indent
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.smartindent    = true
vim.opt.autoindent = true

vim.opt.ignorecase     = true

vim.cmd('syntax enable')

if vim.g.vscode then
  cmdheight = 0 -- this is the new line I added
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'tpope/vim-surround'
Plug 'folke/tokyonight.nvim'
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'lewis6991/gitsigns.nvim'
vim.call('plug#end')

require('lualine').setup()
require('gitsigns').setup()

require("tokyonight").setup({
    style           = "night",          -- Tokyonightのスタイル ("night", "storm", "day", など)
    transparent     = true,       -- 背景色を透明にする
    terminal_colors = true,   -- ターミナルのカラースキームを尊重
})
vim.cmd[[colorscheme tokyonight-storm]]


vim.cmd[[
	nmap <C-S-o> :Files<CR>
]]

vim.cmd[[
	noremap <C-f> <Plug>(easymotion-bd-w)
	"noremap <S-f> <Plug>(easymotion-bd-f)
	"noremap gl <Plug>(easymotion-bd-jk)

    omap ab <Plug>(textobj-multiblock-a)
    omap ib <Plug>(textobj-multiblock-i)
    vmap ab <Plug>(textobj-multiblock-a)
    vmap ib <Plug>(textobj-multiblock-i)
]]

-- Plug 'junegunn/vim-easy-align'
vim.cmd[[
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
]]

vim.cmd[[
    nnoremap * *N
]]

--
--
-- 
--
-- LSP
--
--
--
--

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

