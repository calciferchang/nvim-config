vim.opt.tabstop = 2        -- Width of a tab character
vim.opt.shiftwidth = 2     -- Indentation width for >> and 
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.softtabstop = 2
-- set leader
vim.g.mapleader = ' '

vim.opt.rtp:append(vim.fn.stdpath("config") .. "/nvim-lspconfig")
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/mason.nvim")
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/mason-lspconfig.nvim")
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/nvim-treesitter")
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/telescope.nvim")
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/plenary.nvim")

-- Add the same capabilities to ALL server configurations.
-- Refer to :h vim.lsp.config() for more information.
vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities()
})

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "ts_ls", "astro" }
}

require('nvim-treesitter.configs').setup({
  ensure_installed = { "javascript", "typescript", "tsx", "astro", "html", "css" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

require('telescope').setup({})
-- Keybindings
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')

-- Configure TypeScript LSP
vim.lsp.config.ts_ls = {}
vim.lsp.config.astro = {}
