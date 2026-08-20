vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
  "lua_ls",
  -- "pyright",
  -- "gopls",
  -- "ts_ls",
})

-- Override/extend any server's defaults here, e.g.:
-- vim.lsp.config("lua_ls", {
--   settings = { Lua = { diagnostics = { globals = { "vim" } } } },
-- })
