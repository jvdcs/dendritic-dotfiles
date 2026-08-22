vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "helix-port"

local c = {
	bg = "#1a1a19",
	fg = "#d1d1d1",
	gray01 = "#222221",
	gray02 = "#2a2a29",
	gray03 = "#323231",
	gray04 = "#4b4b4a",
	gray05 = "#6c6c6a",
	gray06 = "#767675",
	blue = "#86adcd",
	cyan = "#499294",
	green = "#60967d",
	yellow = "#ffc591",
	red = "#ff968c",
	magenta = "#de9bc8",
}

local groups = {
	-- treesitter captures that diverge from what they'd otherwise inherit
	["@variable"] = { fg = c.fg, underline = false },
	["@variable.builtin"] = { fg = c.fg, italic = true },
	["@variable.parameter"] = { fg = c.blue, italic = true },
	["@variable.member"] = { fg = c.fg },
	["@module"] = { fg = c.fg, underline = true },
	["@function.macro"] = { fg = c.green, italic = true },
	["@punctuation.bracket"] = { fg = c.gray04 },
	["@punctuation.delimiter"] = { fg = c.gray04 },
	["@string.regexp"] = { fg = c.blue },
	["@string.special"] = { fg = c.blue },

	MyHeirlinePill = { bg = c.gray02 },
	MyHeirlineBg = { bg = c.bg },

	Normal = { fg = c.fg },
	NormalFloat = { fg = c.gray04, bg = c.bg },
	FloatBorder = { fg = c.gray03, bg = c.bg },
	WinSeparator = { fg = c.gray03 },
	LineNr = { fg = c.gray03 },
	CursorLineNr = { fg = c.fg },
	CursorLine = { bg = c.gray01 },
	CursorColumn = { bg = c.gray01 },
	Visual = { fg = c.fg, bg = c.gray03 },
	Search = { fg = c.fg, bg = c.gray03 },
	IncSearch = { fg = c.bg, bg = c.fg },
	MatchParen = { fg = c.fg, bg = c.gray04 },
	Cursor = { fg = c.bg, bg = c.fg },
	StatusLine = { fg = c.fg, bg = c.gray02 },
	StatusLineNC = { fg = c.gray05, bg = c.gray01 },
	TabLine = { fg = c.gray04 },
	TabLineSel = { fg = c.fg, bg = c.gray02 },
	TabLineFill = { fg = c.gray04 },
	Pmenu = { fg = c.fg, bg = c.gray01 },
	PmenuSel = { fg = c.bg, bg = c.fg },
	PmenuThumb = { bg = c.gray04 },
	Directory = { fg = c.gray05 },
	NonText = { fg = c.gray03 },
	ErrorMsg = { fg = c.red, italic = true },
	WarningMsg = { fg = c.yellow, italic = true },

	-- diagnostics
	DiagnosticError = { fg = c.red, italic = true },
	DiagnosticWarn = { fg = c.yellow, italic = true },
	DiagnosticInfo = { fg = c.blue, italic = true },
	DiagnosticHint = { fg = c.green, italic = true },
	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.yellow, underline = true },
	DiagnosticUnderlineInfo = { sp = c.blue, underline = true },
	DiagnosticUnderlineHint = { sp = c.green, underline = true },

	-- diff: fg-only, matching Helix's diff.plus/minus/delta gutter glyphs.
	DiffAdd = { fg = c.green },
	DiffDelete = { fg = c.red },
	DiffChange = { fg = c.magenta },
	DiffText = { fg = c.yellow },

	-- base syntax groups
	Comment = { fg = c.gray04, italic = true },
	Constant = { fg = c.white },
	String = { fg = c.cyan, italic = true },
	Identifier = { fg = c.fg },
	Function = { fg = c.green },
	Statement = { fg = c.gray06 },
	Operator = { fg = c.gray06, italic = true },
	PreProc = { fg = c.gray06 },
	Type = { fg = c.blue },
	Special = { fg = c.fg, italic = true },
	Delimiter = { fg = c.gray04 },
	Error = { fg = c.red, italic = true },

	-- Snacks.nvim UI (Picker & Components)
	SnacksPicker = { link = "Normal" },
	SnacksPickerInput = { link = "Normal" },
	SnacksPickerList = { link = "Normal" },
	SnacksPickerPreview = { link = "Normal" },
	SnacksPickerBorder = { link = "FloatBorder" },
	SnacksPickerInputBorder = { link = "FloatBorder" },
	SnacksPickerListBorder = { link = "FloatBorder" },
	SnacksPickerPreviewBorder = { link = "FloatBorder" },

	SnacksPickerMatch = { fg = c.green, italic = true }, -- Matched characters in search results
	SnacksPickerSelected = { fg = c.fg, bg = c.gray02 }, -- Active row highlight
	SnacksPickerTree = { fg = c.gray04 },

	SnacksPickerDir = { fg = c.gray05 }, -- Dims the path
	SnacksPickerFile = { fg = c.fg }, -- Keeps trailing filename bright

	SnacksPickerTitle = { fg = c.fg },
	SnacksPickerInputTitle = { fg = c.fg },
	SnacksPickerListTitle = { fg = c.fg },
	SnacksPickerPreviewTitle = { fg = c.fg },

	-- WhichKey UI & Background
	WhichKeyNormal = { bg = c.bg },
	WhichKeyBorder = { link = "FloatBorder" },

	-- nvim-notify UI
	NotifyBackground = { bg = c.bg },
	NotifyERRORBorder = { link = "FloatBorder" },
	NotifyERRORIcon = { fg = c.red },
	NotifyERRORTitle = { fg = c.red, italic = true },

	NotifyWARNBorder = { link = "FloatBorder" },
	NotifyWARNIcon = { fg = c.yellow },
	NotifyWARNTitle = { fg = c.yellow, italic = true },

	NotifyINFOBorder = { link = "FloatBorder" },
	NotifyINFOIcon = { fg = c.blue },
	NotifyINFOTitle = { fg = c.blue, italic = true },

	NotifyDEBUGBorder = { link = "FloatBorder" },
	NotifyDEBUGIcon = { fg = c.gray05 },
	NotifyDEBUGTitle = { fg = c.gray05, italic = true },

	NotifyTRACEBorder = { link = "FloatBorder" },
	NotifyTRACEIcon = { fg = c.magenta },
	NotifyTRACETitle = { fg = c.magenta, italic = true },

	-- Folding (Native Neovim & nvim-ufo)
	Folded = { fg = c.gray05, bg = c.gray01 },
	FoldColumn = { fg = c.gray04 },

	UfoFoldedFg = { fg = c.gray05 },
	UfoFoldedBg = { bg = c.gray01 },
	UfoFoldedEllipsis = { fg = c.blue },
	UfoPreviewNormal = { link = "NormalFloat" },
	UfoPreviewBorder = { link = "FloatBorder" },

	-- Native Neovim Winbar
	WinBar = { link = "Normal" },
	WinBarNC = { link = "Normal" },

	-- DropBar
	DropBarMenuNormalFloat = { fg = c.fg, bg = c.gray01 },
	DropBarMenuCurrentContext = { fg = c.fg, bg = c.gray03, bold = true },
	DropBarMenuHover = { fg = c.fg, bg = c.gray02, bold = true },
	DropBarMenuSbar = { bg = c.gray02 },
	DropBarMenuThumb = { bg = c.gray04 },

	DropBarMenuHoverEntry = { fg = c.bg, bg = c.fg },
	DropBarMenuHoverSymbol = { fg = c.bg, bg = c.fg, bold = true },
	DropBarMenuHoverIcon = { fg = c.bg, bg = c.fg },

	-- Gitsigns
	GitSignsAdd = { fg = c.green },
	GitSignsChange = { fg = c.magenta },
	GitSignsDelete = { fg = c.red },
	GitSignsChangedelete = { fg = c.magenta },
	GitSignsTopdelete = { fg = c.red },
	GitSignsUntracked = { fg = c.cyan },

	-- Noice
	NoiceCmdlinePopupBorder = { fg = c.gray03 },
	NoiceCmdlinePopupTitle = { fg = c.fg },
	NoiceCmdlinePopupTitleCmdline = { fg = c.fg },
	NoiceLspProgressTitle = { fg = c.gray04 },

	-- blink.cmp
	BlinkCmpMenu = { fg = c.fg, bg = c.bg },
	BlinkCmpMenuBorder = { link = "FloatBorder" },
	BlinkCmpMenuSelection = { bg = c.gray02 },
	BlinkCmpLabel = { fg = c.fg },
	BlinkCmpLabelMatch = { fg = c.green, italic = true },
	BlinkCmpLabelDeprecated = { fg = c.gray05, strikethrough = true },
	BlinkCmpLabelDescription = { fg = c.gray05 },
	BlinkCmpLabelDetail = { fg = c.gray05 },
	BlinkCmpGhostText = { fg = c.gray04 },
	BlinkCmpDoc = { fg = c.fg },
	BlinkCmpDocBorder = { link = "FloatBorder" },
	BlinkCmpDocSeparator = { fg = c.gray03 },
	BlinkCmpSignatureHelp = { link = "NormalFloat" },
	BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
	BlinkCmpSignatureHelpActiveParameter = { fg = c.yellow, bold = true },
	BlinkCmpKind = { fg = c.gray05 },
	BlinkCmpKindText = { fg = c.fg },
	BlinkCmpKindMethod = { fg = c.green },
	BlinkCmpKindFunction = { fg = c.green },
	BlinkCmpKindConstructor = { fg = c.green },
	BlinkCmpKindField = { fg = c.fg },
	BlinkCmpKindVariable = { fg = c.fg },
	BlinkCmpKindProperty = { fg = c.fg },
	BlinkCmpKindClass = { fg = c.blue },
	BlinkCmpKindInterface = { fg = c.blue },
	BlinkCmpKindStruct = { fg = c.blue },
	BlinkCmpKindModule = { fg = c.blue, underline = true },
	BlinkCmpKindEnum = { fg = c.blue },
	BlinkCmpKindEnumMember = { fg = c.magenta },
	BlinkCmpKindKeyword = { fg = c.gray06 },
	BlinkCmpKindOperator = { fg = c.gray06, italic = true },
	BlinkCmpKindTypeParameter = { fg = c.blue, italic = true },
	BlinkCmpKindConstant = { fg = c.magenta },
	BlinkCmpKindValue = { fg = c.magenta },
	BlinkCmpKindSnippet = { fg = c.yellow },
	BlinkCmpKindFile = { fg = c.gray05 },
	BlinkCmpKindFolder = { fg = c.gray05 },
	BlinkCmpKindReference = { fg = c.cyan },
	BlinkCmpKindColor = { fg = c.cyan },
	BlinkCmpKindUnit = { fg = c.cyan },
	BlinkCmpKindEvent = { fg = c.red },
	BlinkCmpSource = { fg = c.gray05, italic = true },
}

for name, hl in pairs(groups) do
	vim.api.nvim_set_hl(0, name, hl)
end

-- Dynamically color all devicons using your exact theme palette
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/rachartier/tiny-devicons-auto-colors.nvim",
})

local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
local tiny_ok, tiny_devicons = pcall(require, "tiny-devicons-auto-colors")

if devicons_ok and tiny_ok then
	devicons.setup()
	tiny_devicons.setup({
		colors = { c.blue, c.cyan, c.green, c.yellow, c.red, c.magenta },
		cache = { enabled = true },
	})
end
