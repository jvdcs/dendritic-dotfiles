vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup() -- populates vim.b.gitsigns_head per buffer

vim.o.laststatus = 3
-- 0: Never show statuslines
-- 1: Show statusline only if there are 2 or more splits
-- 2: Show a statusline for every split pane (default)
-- 3: Show one global statusline at the very bottom
vim.o.showcmdloc = "statusline"

local CAPL, CAPR = "", ""
local p = require("palette")

p:set_multi({
	{ "StModeN", { fg = p.fg, bg = p.gray04, bold = true } },
	{ "StModeNSep", { fg = p.gray04 } },
	{ "StModeI", { fg = p.bg, bg = p.fg, bold = true } },
	{ "StModeISep", { fg = p.fg } },
	{ "StModeV", { fg = p.bg, bg = p.green, bold = true } },
	{ "StModeVSep", { fg = p.green } },
	{ "StModeC", { fg = p.bg, bg = p.red, bold = true } },
	{ "StModeCSep", { fg = p.red } },
	{ "StModeR", { fg = p.bg, bg = p.blue, bold = true } },
	{ "StModeRSep", { fg = p.blue } },
	{ "StBranch", { fg = p.bg, bg = p.fg, bold = true } },
	{ "StBranchSep", { fg = p.fg } },
	{ "StNoGit", { fg = p.fg, bg = p.gray04, bold = true } },
	{ "StNoGitSep", { fg = p.gray04 } },
})

local modes = {
	n = { "NORMAL", "StModeN" },
	i = { "INSERT", "StModeI" },
	v = { "VISUAL", "StModeV" },
	[""] = { "VISUAL", "StModeV" },
	V = { "V-LINE", "StModeV" },
	c = { "COMMAND", "StModeC" },
	R = { "REPLACE", "StModeR" },
	t = { "TERMINAL", "StModeV" },
}

_G.Statusline = {}
function _G.Statusline.mode()
	local m = modes[vim.fn.mode()] or { vim.fn.mode(), "StModeN" }
	return "%#"
		.. m[2]
		.. "Sep#"
		.. CAPL
		.. "%#"
		.. m[2]
		.. "# "
		.. m[1]
		.. " %#"
		.. m[2]
		.. "Sep#"
		.. CAPR
		.. "%#StatusLine#"
end

function _G.Statusline.branch()
	if vim.b.gitsigns_head then
		return "%#StBranchSep#"
			.. CAPL
			.. "%#StBranch#"
			.. vim.b.gitsigns_head
			.. "%#StBranchSep#"
			.. CAPR
			.. "%#StatusLine#"
	end
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- fallback: current directory name
	return "%#StNoGitSep#" .. CAPL .. "%#StNoGit#  " .. cwd .. "  %#StNoGitSep#" .. CAPR .. "%#StatusLine#"
end

vim.o.statusline = "%{%v:lua.Statusline.mode()%} %S%=%t %m%=%{%v:lua.Statusline.branch()%}"
