vim.pack.add({"https://github.com/folke/which-key.nvim"})

require("which-key").setup({
  delay = 0,             -- Delay (ms) before popup shows
  preset = "classic",      -- "classic", "modern", or "helix"
  notify = false,          -- Disable startup notifications
})
