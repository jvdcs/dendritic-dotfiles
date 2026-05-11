-- LSP
vim.lsp.config('tinymist', {})
vim.lsp.enable('tinymist')

-- LuaSnip
local ls = require("luasnip")
ls.config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true })

vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true })
vim.keymap.set("i", "<M-n>", "\\ <CR>", { silent = true })
vim.opt.clipboard = "unnamedplus"

-- Tab jump fix: MUST map both insert AND select mode
vim.keymap.set("i", "<Tab>", function()
  if ls.expand_or_jumpable() then ls.expand_or_jump()
  else vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>",true,false,true),"n",false)
  end
end, { silent = true })
vim.keymap.set("s", "<Tab>",   function() ls.jump(1)  end, { silent = true })
vim.keymap.set({"i","s"}, "<S-Tab>", function() ls.jump(-1) end, { silent = true })

-- Preview
require('typst-preview').setup{}
vim.keymap.set('n', '<leader>pv', ':TypstPreview<CR>',     { desc = "Preview toggle" })
vim.keymap.set('n', '<leader>ps', ':TypstPreviewStop<CR>', { desc = "Preview stop" })


-- Typstar
require('typstar').setup({ add_undo_breakpoints = true })
vim.keymap.set({ "s", "i" }, "<M-j>", "<Cmd>TypstarSmartJump<CR>")
vim.keymap.set({ "s", "i" }, "<M-k>", "<Cmd>TypstarSmartJumpBack<CR>")
vim.keymap.set({ "n", "i" }, "<M-t>", "<Cmd>TypstarToggleSnippets<CR>")

-- Load custom snippets
require("snippets.typst")
