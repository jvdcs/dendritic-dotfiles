vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
local p = require("palette")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	p:set_multi({
		{ "RainbowRed", { fg = p.gray01 } },
		{ "RainbowYellow", { fg = p.gray02 } },
		{ "RainbowBlue", { fg = p.gray01 } },
		{ "RainbowOrange", { fg = p.gray02 } },
		{ "RainbowGreen", { fg = p.gray01 } },
		{ "RainbowViolet", { fg = p.gray02 } },
		{ "RainbowCyan", { fg = p.gray01 } },
	})
	-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	-- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	-- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	-- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	-- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	-- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({
	indent = {
		-- char = "│",
		highlight = highlight,
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
	},
	-- exclude = {
	--   filetypes = { "help", "alpha", "dashboard", "lazy", "mason" },
	-- },
})
