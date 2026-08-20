vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })

require("nvim-web-devicons").setup({
  -- default = true,     -- Falls back to a generic file icon if extension is unknown
  color_icons = true, -- Enables color highlights for icons
})
