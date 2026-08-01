-- 1. Load your completion engine FIRST so it can register its global hooks
require("blink.cmp").setup({
  keymap = {
    preset        = "none",
    ["<CR>"]      = { "accept", "fallback" },
    ["\x1ba"]     = { "select_and_accept", "fallback" },
    ["<C-space>"] = { "show", "fallback" },
    ["<C-e>"]     = { "cancel", "fallback" },
    ['<M-j>'] = { 'select_next', 'fallback' },
    ['<M-k>'] = { 'select_prev', 'fallback' },
  },
  completion = { 
    list = { selection = { preselect = false, auto_insert = false } },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      window = { border = "rounded" },
    },
  },
})
