vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	explorer = {
		enabled = true,
		replace_netrw = true,
	},
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
					["<M-q>"] = { "qflist", mode = { "i", "n" } },
					-- ["<M-q>"] = { "loclist", mode = { "i", "n" } },
					["<C-s>"] = { "edit_split", mode = { "i", "n" } },
					["<C-d>"] = { "edit_vsplit", mode = { "i", "n" } },
				},
			},
		},
		sources = {
			explorer = {
				hidden = true,
				ignored = false,
				layout = {
					preset = "sidebar", -- 使用侧边栏布局
					-- preview = false, -- 关闭预览窗口，节省空间
					layout = {
						position = "left", -- 确保在左侧
						width = 32, -- 设置为你想要的宽度
						min_width = 32, -- 最小宽度，防止被意外缩小
					},
				},
				win = {
					input = {
						keys = {
							["<Esc>"] = { "", mode = "n" },
						},
					},
					list = {
						keys = {
							["<Esc>"] = { "", mode = "n" },
						},
					},
				},
			},
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
