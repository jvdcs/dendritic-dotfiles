require("mini.ai").setup({
	custom_textobjects = {
		["$"] = require("mini.ai").gen_spec.pair("$", "$", { type = "non-balanced" }),
	},
})

-- Typstar
require("typstar").setup({
	snippets = {
		exclude = {
			"sq",
			"dx",
			"ddx",
			"ss",
			"int",
			"dint",
			"sp",
			"su",
			"ub",
			"sub",
			"le",
			"gt",
			"_",
			"sum",
			"div",
			"sqrt",
			"iv",
			"vi",
			"fo",
			"for",
			"st",
			"ne",
		},
		visual_disable_postfix = {
			"ub",
			"iv",
			"st",
		},
	},
})
