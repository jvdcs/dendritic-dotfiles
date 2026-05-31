local map = vim.keymap.set

-- Mini.ai (Moved from typst.lua)
require('mini.ai').setup({
  custom_textobjects = {
    ['$'] = require('mini.ai').gen_spec.pair('$', '$', { type = 'non-balanced' }),
  },
})

-- Typstar
require("typstar").setup({ snippets = { exclude = { "sq", "dx", "ddx", "ss" } } })
map({ "s", "i" }, "<M-j>", "<Cmd>TypstarSmartJump<CR>")
map({ "s", "i" }, "<M-k>", "<Cmd>TypstarSmartJumpBack<CR>")
map({ "n", "i" }, "<M-t>", "<Cmd>TypstarToggleSnippets<CR>")

-- Typst Preview Setup & Keymaps
require("typst-preview").setup {}
map("n", "<leader>pv", ":TypstPreview<CR>",     { desc = "Preview toggle" })
map("n", "<leader>ps", ":TypstPreviewStop<CR>", { desc = "Preview stop" })

-- (PASTE ALL YOUR typst-preview AUTOCMD LOGIC HERE: is_snacks_picker_open, BufEnter, BufDelete)
