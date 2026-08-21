vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/mikavilpas/yazi.nvim",
})

require("yazi").setup({
  -- open_for_directories = true, -- true = yazi replaces netrw when you `:e` a directory
  open_multiple_tabs   = true, -- true = open all visible splits as yazi tabs
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


