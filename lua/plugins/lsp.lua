return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({
  		cmd = {
    		"clangd",
    		"--background-index",
    		"--clang-tidy",
    		"--clang-tidy-checks=performance-*,bugprone-*,modernize-*",
    		"--completion-style=detailed",
    		"--header-insertion=iwyu",
  		},
  		on_attach = function(client, bufnr)
    		-- Kills the duplicate 'pull' diagnostics in Neovim 0.10+
    		client.server_capabilities.diagnosticProvider = false
  		end,
  		})
      lspconfig.lua_ls.setup({})
    end,
  },
}