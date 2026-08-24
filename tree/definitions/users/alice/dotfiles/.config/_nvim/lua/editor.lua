local map = vim.keymap.set

-- Indent Guides
vim.api.nvim_set_hl(0, "FaintIndentLines", { fg = "#222221", nocombine = true })
require("ibl").setup({
	indent = {
		char = "▏",
		highlight = "FaintIndentLines",
	},
})
-- Surround
require("nvim-surround").setup({
	surrounds = {
		["("] = { add = { "(", ")" } },
		[")"] = { add = { "(", ")" } },
		["["] = { add = { "[", "]" } },
		["]"] = { add = { "[", "]" } },
		["{"] = { add = { "{", "}" } },
		["}"] = { add = { "{", "}" } },
	},
})
