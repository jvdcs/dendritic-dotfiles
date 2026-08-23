vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup() -- populates vim.b.gitsigns_head per buffer

vim.o.laststatus = 3
vim.o.showcmdloc = "statusline"

local CAPL, CAPR = "", ""

vim.api.nvim_set_hl(0, "StModeN", { fg = "#1e1e2e", bg = "#a6e3a1", bold = true })
vim.api.nvim_set_hl(0, "StModeNSep", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "StModeI", { fg = "#1e1e2e", bg = "#89b4fa", bold = true })
vim.api.nvim_set_hl(0, "StModeISep", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "StModeV", { fg = "#1e1e2e", bg = "#cba6f7", bold = true })
vim.api.nvim_set_hl(0, "StModeVSep", { fg = "#cba6f7" })
vim.api.nvim_set_hl(0, "StModeC", { fg = "#1e1e2e", bg = "#f9e2af", bold = true })
vim.api.nvim_set_hl(0, "StModeCSep", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "StModeR", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
vim.api.nvim_set_hl(0, "StModeRSep", { fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "StBranch", { fg = "#1e1e2e", bg = "#fab387", bold = true }) -- git branch pill
vim.api.nvim_set_hl(0, "StBranchSep", { fg = "#fab387" })
vim.api.nvim_set_hl(0, "StNoGit", { fg = "#1e1e2e", bg = "#6c7086", bold = true }) -- fallback (cwd) pill, dimmer on purpose
vim.api.nvim_set_hl(0, "StNoGitSep", { fg = "#6c7086" })

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
			.. "%#StBranch#  "
			.. vim.b.gitsigns_head
			.. " %#StBranchSep#"
			.. CAPR
			.. "%#StatusLine#"
	end
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- fallback: current directory name
	return "%#StNoGitSep#" .. CAPL .. "%#StNoGit#  " .. cwd .. " %#StNoGitSep#" .. CAPR .. "%#StatusLine#"
end

vim.o.statusline = "%{%v:lua.Statusline.mode()%} %S%=%t %m%=%{%v:lua.Statusline.branch()%}"
