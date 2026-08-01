-- Diagnostics
vim.diagnostic.config({
  virtual_text = { prefix = "●", severity = { min = vim.diagnostic.severity.HINT } },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP Servers
-- (server-specific settings for tinymist live in nvim/lsp/tinymist.lua,
-- auto-discovered by Neovim's built-in lsp config loader)
vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")
vim.lsp.config("tinymist", {})
vim.lsp.enable("tinymist")

-- LspAttach Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set("n", "<leader>k",  vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>d",  vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>r",  vim.lsp.buf.rename, opts)
    -- NOTE: was <leader>a, which collided with the Harpoon "add file" keymap
    -- in plugins/editor.lua (Harpoon kept <leader>a since it's the more
    -- frequently used binding; code actions moved to <leader>ca instead).
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})
