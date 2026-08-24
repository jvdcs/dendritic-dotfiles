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
					-- ["<M-Q>"] = { "qflist", mode = { "i", "n" } },
					["<M-q>"] = { "loclist", mode = { "i", "n" } },
					["<C-s>"] = { "edit_split", mode = { "i", "n" } },
					["<C-d>"] = { "edit_vsplit", mode = { "i", "n" } },
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
