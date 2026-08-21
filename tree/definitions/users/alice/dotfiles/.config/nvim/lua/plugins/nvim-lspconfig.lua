vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/folke/lazydev.nvim",
})

require('lazydev').setup({
  library = { 'luvit-meta/library' }, -- optional, only if you use vim.uv/luv heavily
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.stylua.toml', '.git' }, -- shared root = shared client, zero respawn lag
  -- root_markers = { { '.luarc.json', '.git' } }, -- uncomment: treat these as equal-priority instead of ordered fallback
  capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), {
    workspace = { didChangeWatchedFiles = { dynamicRegistration = false } }, -- kills file-watcher CPU churn
  }),
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false }, -- , library = { vim.env.VIMRUNTIME .. '/lua' } },
      telemetry = { enable = false },
      -- diagnostics = { workspaceDelay = -1, workspaceEvent = "OnSave" }, -- uncomment: re-diagnose whole workspace on save only, not every keystroke
    },
  },
})
vim.lsp.enable('lua_ls')
