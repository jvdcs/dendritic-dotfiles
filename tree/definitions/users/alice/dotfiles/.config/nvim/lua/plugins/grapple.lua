vim.pack.add({ "https://github.com/cbochs/grapple.nvim" })

require("grapple").setup({
	scope = "git", -- "git" | "git_branch" | "cwd" | "global" — how tags are grouped per-project
})

vim.keymap.set("n", "<leader>gg", require("grapple").toggle, { desc = "Grapple toggle tag" })
vim.keymap.set("n", "<leader>gt", require("grapple").toggle_tags, { desc = "Grapple open list" })
vim.keymap.set("n", "<leader>ga", function()
	require("grapple").select({ index = 1 })
end, { desc = "Grapple file 1" })
vim.keymap.set("n", "<leader>gs", function()
	require("grapple").select({ index = 2 })
end, { desc = "Grapple file 2" })
vim.keymap.set("n", "<leader>gd", function()
	require("grapple").select({ index = 3 })
end, { desc = "Grapple file 3" })
vim.keymap.set("n", "<leader>gf", function()
	require("grapple").select({ index = 4 })
end, { desc = "Grapple file 4" })
