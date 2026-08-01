local map = vim.keymap.set

-- Indent Guides
vim.api.nvim_set_hl(0, "FaintIndentLines", { fg = "#2a2a29", nocombine = true })
require("ibl").setup({
  indent = {
    char = "▏",
    highlight = "FaintIndentLines",
  },
})

-- Surround
require("nvim-surround").setup({
  surrounds = {
    ["("] = { add = { "(", ")" } }, [")"] = { add = { "(", ")" } },
    ["["] = { add = { "[", "]" } }, ["]"] = { add = { "[", "]" } },
    ["{"] = { add = { "{", "}" } }, ["}"] = { add = { "{", "}" } },
  },
})

-- Subword Select
vim.g.VM_maps = {
  ["Find Under"]         = "<A-n>",
  ["Find Subword Under"] = "<A-n>",
  ["Find Next"]          = "<A-n>",
  ["Find Prev"]          = "<A-N>",
}

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
map("n", "<leader>a", function() harpoon:list():add(); print("Harpooned") end, { desc = "Harpoon Add" })
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
map("n", "<leader>h", function() harpoon:list():select(1) end)
map("n", "<leader>t", function() harpoon:list():select(2) end)
map("n", "<leader>n", function() harpoon:list():select(3) end)
map("n", "<leader>s", function() harpoon:list():select(4) end)

-- Snacks
require("snacks").setup({ picker = { enabled = true } })
map("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "Find Buffers" })
map("n", "<leader>f", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
