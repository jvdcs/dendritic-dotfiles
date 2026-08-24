vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" })

require("multicursor-nvim").setup({
	-- shallow_match = false, -- Match exact word case when searching next match
})

vim.keymap.set({ "n", "v" }, "<A-n>", function()
	require("multicursor-nvim").matchAddCursor(1)
end, { desc = "Add next match cursor" })
vim.keymap.set({ "n", "v" }, "<A-N>", function()
	require("multicursor-nvim").matchAddCursor(-1)
end, { desc = "Add next match cursor" })
-- vim.keymap.set({ "n", "v" }, "<C-s>", function() require("multicursor-nvim").matchSkipCursor(1) end, { desc = "Skip match cursor" })
-- vim.keymap.set({ "n", "v" }, "<C-Up>", function() require("multicursor-nvim").lineAddCursor(-1) end, { desc = "Add cursor above" })
-- vim.keymap.set({ "n", "v" }, "<C-Down>", function() require("multicursor-nvim").lineAddCursor(1) end, { desc = "Add cursor below" })

vim.keymap.set("n", "<Esc>", function()
	if require("multicursor-nvim").hasCursors() then
		require("multicursor-nvim").clearCursors()
	else
		vim.cmd("nohlsearch")
	end
end, { desc = "Clear cursors" })
