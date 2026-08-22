vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	picker = {
		enabled = true,
		prompt = "❯ ",
		formatters = {
			file = {
				filename_first = true,
			},
		},
		icons = {
			ui = {
				selected = "❯ ",
			},
		},
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
				},
			},
		},
		sources = {
			files = {
				hidden = true,
			},
			grep = {
				hidden = true,
				args = { "--hidden", "--glob", "!**/.git/*" },
			},
			buffers = {
				current = false,
				sort_lastused = true,
			},
		},
	},
})

local S = vim.keymap.set

S("n", "<leader>F", function()
	Snacks.picker.files({ cwd = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) })
end, { desc = "Find files in current buffer dir" })
S("n", "<leader>?", function()
	Snacks.picker.grep({ cwd = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) })
end, { desc = "Live grep in current buffer dir" })

S("n", "<leader>b", function()
	Snacks.picker.buffers()
end, { desc = "[b]uffer list" })
S("n", "<leader>h", function()
	Snacks.picker.help()
end, { desc = "[h]elp tags" })
S("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "grep" })
S("n", "<leader>f", function()
	Snacks.picker.files()
end, { desc = "[f]ind files" })
S("n", "<leader>sh", function()
	Snacks.picker.highlights()
end, { desc = "[s]earch highlights" })
