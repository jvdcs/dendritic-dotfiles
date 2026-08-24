vim.pack.add({ "https://github.com/echasnovski/mini.bufremove" })

require("mini.bufremove").setup({
	-- silent = false, -- Whether to suppress info/error messages
})

vim.keymap.set("n", "<leader>db", function()
	require("mini.bufremove").delete(0, false) -- (0 = current buffer, false = don't force write/discard)
end, { desc = "Delete buffer (keep window)" })
vim.keymap.set("n", "<leader>dw", "<C-w>c", { desc = "[w]indow close" })
