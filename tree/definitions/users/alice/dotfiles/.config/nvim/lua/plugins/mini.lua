vim.pack.add({ "https://github.com/hrsh7th/nvim-cmp" })
vim.pack.add({ "https://github.com/hrsh7th/cmp-cmdline" })

local cmp = require("cmp")

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline({
    ["<Down>"] = { c = cmp.mapping.select_next_item() },
    ["<Up>"] = { c = cmp.mapping.select_prev_item() },
  }),
  
  sources = cmp.config.sources({
    { name = "cmdline" } 
  })
})
