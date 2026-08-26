-- Add the plugin
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
vim.pack.add({ "https://github.com/MeanderingProgrammer/treesitter-modules.nvim" })

-- Your existing treesitter setup stays the same
local ts = require("nvim-treesitter")
ts.setup({
	-- install_dir = vim.fn.stdpath('data') .. '/site',
})
ts.install({ "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "toml" })

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- DELETE this entire block - it's what's causing the error:
-- local tsc = require("nvim-treesitter.config")
-- tsc.setup({
--     incremental_selection = { ... },
--     highlight = { enable = true },
--     indent = { enable = true },
-- })

-- REPLACE with this:
require("treesitter-modules").setup({
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<A-o>", -- Start selection
			node_incremental = "<A-o>", -- Expand to parent
			node_decremental = "<A-i>", -- Shrink selection
		},
	},
})
