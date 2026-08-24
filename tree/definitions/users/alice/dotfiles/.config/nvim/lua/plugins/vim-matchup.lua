vim.pack.add({ "https://github.com/andymass/vim-matchup" })

vim.g.matchup_matchparen_offscreen = {
	method = "popup",
} -- Show offscreen pairs in a popup window
vim.g.matchup_matchparen_deferred = 0
vim.g.matchup_matchparen_timeout = 50
vim.g.matchup_matchparen_insert_timeout = 20

local p = require("palette")
-- Customize the visual highlight of the matching bracket
vim.api.nvim_set_hl(0, "MatchParen", {
	fg = p.fg,
	bold = true,
	bg = p.gray04,
	-- underline = true,
})
