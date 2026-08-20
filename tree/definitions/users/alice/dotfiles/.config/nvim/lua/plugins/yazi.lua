vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim", -- required dependency, no config needed
  "https://github.com/mikavilpas/yazi.nvim",
})

require("yazi").setup({
  -- open_for_directories = false, -- true = yazi replaces netrw when you `:e` a directory
  -- open_multiple_tabs   = false, -- true = open all visible splits as yazi tabs
})

vim.keymap.set({ "n", "v" }, "<C-space>", "<cmd>Yazi<cr>", { desc = "Open yazi at current file" })
