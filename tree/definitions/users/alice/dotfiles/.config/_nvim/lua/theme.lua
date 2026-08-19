vim.opt.termguicolors = true

local c = {
	bg      = "#1a1a19",
	fg      = "#d1d1d1",
	blue    = "#86adcd",
	cyan    = "#499294",
	green   = "#60967d",
	yellow  = "#ffc591",
	red     = "#ff968c",
	magenta = "#de9bc8",
	white   = "#d1d1d1",
	black   = "#323231",
	gray00  = "#181818",
	gray01  = "#222221",
	gray02  = "#2a2a29",
	gray03  = "#323231",
	gray04  = "#4b4b4a",
	gray05  = "#6c6c6a",
	gray06  = "#767675",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "my_neat_theme"

local hl = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end
local inherit = function(group, target) vim.api.nvim_set_hl(0, group, { link = target }) end

-- 1. Core Syntax (Neovim auto-links Treesitter & LSP here)
hl("Comment", { fg = c.gray04, italic = true })
hl("Constant", { fg = c.magenta })
hl("String", { fg = c.cyan, italic = true })
hl("Function", { fg = c.green })
hl("Keyword", { fg = c.gray06 })
hl("Operator", { fg = c.gray06, italic = true })
hl("Type", { fg = c.blue })
hl("Identifier", { fg = c.fg })
hl("Special", { fg = c.gray04 })
hl("Error", { fg = c.red })

-- 2. Base UI & Float targets
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg })
hl("FloatBorder", { fg = c.gray03, bg = c.bg })
hl("LineNr", { fg = c.gray03 })
hl("Visual", { fg = c.white, bg = c.gray03 })

-- 3. Telescope inheritance
inherit("TelescopeNormal", "NormalFloat")
inherit("TelescopeBorder", "FloatBorder")
inherit("TelescopePromptNormal", "NormalFloat")
inherit("TelescopePromptBorder", "FloatBorder")
inherit("TelescopePromptTitle", "Title")
inherit("TelescopeResultsNormal", "NormalFloat")
inherit("TelescopeResultsBorder", "FloatBorder")
inherit("TelescopeResultsTitle", "Title")
inherit("TelescopePreviewNormal", "NormalFloat")
inherit("TelescopePreviewBorder", "FloatBorder")
inherit("TelescopePreviewTitle", "Title")
