vim.pack.add({ "https://github.com/chomosuke/typst-preview.nvim" })

require("typst-preview").setup({
	-- debug = false,          -- Enable debug logging to data/typst-preview/log.txt
	-- open_cmd = nil,         -- Custom command to open preview, e.g. "firefox %s -P typst-preview"
	-- port = 0,               -- Custom port (0 = random)
	-- host = nil,             -- Custom host (0.0.0.0 not supported)
})

vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { desc = "Start Typst preview" })
vim.keymap.set("n", "<leader>ts", ":TypstPreviewStop<CR>", { desc = "Stop Typst preview" })
vim.keymap.set("n", "<leader>tt", ":TypstPreviewToggle<CR>", { desc = "Toggle Typst preview" })
