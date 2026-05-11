-- LSP
vim.lsp.config('tinymist', {})
vim.lsp.enable('tinymist')

-- Preview
require('typst-preview').setup{}
vim.keymap.set('n', '<leader>pv', ':TypstPreview<CR>',     { desc = "Preview toggle" })
vim.keymap.set('n', '<leader>ps', ':TypstPreviewStop<CR>', { desc = "Preview stop" })

-- LuaSnip
local ls = require("luasnip")
ls.config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

-- Typstar
require('typstar').setup({ add_undo_breakpoints = true })
vim.keymap.set({ "s", "i" }, "<M-j>", "<Cmd>TypstarSmartJump<CR>")
vim.keymap.set({ "s", "i" }, "<M-k>", "<Cmd>TypstarSmartJumpBack<CR>")
vim.keymap.set({ "n", "i" }, "<M-t>", "<Cmd>TypstarToggleSnippets<CR>")

-- Load custom snippets
require("snippets.typst")
