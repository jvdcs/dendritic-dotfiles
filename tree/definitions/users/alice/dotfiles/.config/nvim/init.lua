-- ── Options ───────────────────────────────────────────────────────────────────
vim.opt.updatetime  = 1
vim.opt.regexpengine = 0
vim.opt.clipboard   = "unnamedplus"
vim.g._ts_force_sync_parsing = true

-- ── Appearance ────────────────────────────────────────────────────────────────
vim.o.termguicolors = false
vim.cmd("colorscheme default")
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<C-R>", "<cmd>so $MYVIMRC<CR>")
vim.keymap.set("i", "<M-n>", "\\ <CR>", { silent = true })

-- Delete matching closing bracket with <BS>
vim.keymap.set("i", "<BS>", function()
  local line   = vim.api.nvim_get_current_line()
  local col    = vim.api.nvim_win_get_cursor(0)[2]
  local before = line:sub(col, col)
  local after  = line:sub(col + 1, col + 1)
  local pairs  = { ["("] = ")", ["["] = "]", ["{"] = "}" }
  if pairs[before] and pairs[before] == after then
    return "<Del><BS>"
  end
  return "<BS>"
end, { expr = true, silent = true })

-- ── LSP ───────────────────────────────────────────────────────────────────────
vim.lsp.config("tinymist", {})
vim.lsp.enable("tinymist")

-- ── Completion (blink.cmp) ────────────────────────────────────────────────────
require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<CR>"]      = { "accept", "fallback" },
    ["\x1ba"]     = { "select_and_accept", "fallback" },
    ["<C-space>"] = { "show", "fallback" },
    ["<C-e>"]     = { "cancel", "fallback" },
    ["<Up>"]      = { "select_prev", "fallback" },
    ["<Down>"]    = { "select_next", "fallback" },
  },
  completion = {
    list = {
      selection = {
        preselect  = false,
        auto_insert = false,
      },
    },
  },
})

-- ── Snippets (LuaSnip) ────────────────────────────────────────────────────────
local ls = require("luasnip")
ls.config.set_config({
  enable_autosnippets  = true,
  store_selection_keys = "<Tab>",
})

vim.keymap.set("i", "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false
    )
  end
end, { silent = true })
vim.keymap.set("s",        "<Tab>",   function() ls.jump(1)  end, { silent = true })
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, { silent = true })

require("snippets.typst")

-- ── Typstar ───────────────────────────────────────────────────────────────────
require("typstar").setup({
  snippets = { exclude = { "sq" } },
})

vim.keymap.set({ "s", "i" }, "<M-j>", "<Cmd>TypstarSmartJump<CR>")
vim.keymap.set({ "s", "i" }, "<M-k>", "<Cmd>TypstarSmartJumpBack<CR>")
vim.keymap.set({ "n", "i" }, "<M-t>", "<Cmd>TypstarToggleSnippets<CR>")

-- ── Typst preview ─────────────────────────────────────────────────────────────
require("typst-preview").setup{}

vim.keymap.set("n", "<leader>pv", ":TypstPreview<CR>",     { desc = "Preview toggle" })
vim.keymap.set("n", "<leader>ps", ":TypstPreviewStop<CR>", { desc = "Preview stop" })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern  = "*.typ",
  callback = function() vim.cmd("TypstPreview") end,
})
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern  = "*.typ",
  callback = function() vim.cmd("TypstPreviewStop") end,
})
