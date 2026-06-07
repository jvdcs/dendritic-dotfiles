-- Diagnostics
vim.diagnostic.config({
  virtual_text = { prefix = "●", severity = { min = vim.diagnostic.severity.HINT } },
  signs = true, underline = true, update_in_insert = false, severity_sort = true,
})

-- LSP Servers
vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")
vim.lsp.config("tinymist", {})
vim.lsp.enable("tinymist")

-- LspAttach Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover,          opts)
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition,       opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,           opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,      opts)
    vim.keymap.set("n", "[d",        vim.diagnostic.goto_prev,     opts)
    vim.keymap.set("n", "]d",        vim.diagnostic.goto_next,     opts)
  end,
})

-- Blink.cmp
require("blink.cmp").setup({
  keymap = {
    preset        = "none",
    ["<CR>"]      = { "accept", "fallback" },
    ["\x1ba"]     = { "select_and_accept", "fallback" },
    ["<C-space>"] = { "show", "fallback" },
    ["<C-e>"]     = { "cancel", "fallback" },
    ["<Up>"]      = { "select_prev", "fallback" },
    ["<Down>"]    = { "select_next", "fallback" },
  },
  completion = { list = { selection = { preselect = false, auto_insert = false } } },
})
