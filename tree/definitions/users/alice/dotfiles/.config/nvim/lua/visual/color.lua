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
  -- editor chrome. Normal stays transparent, matching the source theme's
  -- ui.background (fg only, no bg given). Floats/menus get a solid bg
  -- anyway -- a see-through completion popup is unreadable in practice.
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
  -- gitsigns.nvim etc. derive sign colors from these automatically.
  DiffAdd = { fg = c.green },
  DiffDelete = { fg = c.red },
  DiffChange = { fg = c.magenta },
  DiffText = { fg = c.yellow },

  -- base syntax groups. Everything not listed here (String, Character,
  -- Number, Boolean, Float, Conditional, Repeat, Label, Exception,
  -- Include, Define, Macro, StorageClass, Structure, Typedef, SpecialChar,
  -- Tag, SpecialComment, Debug) default-links to one of these.
  Comment = { fg = c.gray04, italic = true },
  Constant = { fg = c.magenta },
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

  -- treesitter captures that diverge from what they'd otherwise inherit
  ["@variable"] = { fg = c.blue, underline = false },
  ["@variable.builtin"] = { fg = c.blue, italic = true },
  ["@variable.parameter"] = { fg = c.fg, italic = true },
  ["@variable.member"] = { fg = c.blue },
  ["@module"] = { fg = c.fg, underline = true },
  ["@function.macro"] = { fg = c.green, italic = true },
  ["@punctuation.bracket"] = { fg = c.gray04 },
  ["@punctuation.delimiter"] = { fg = c.gray04 },
  ["@string.regexp"] = { fg = c.blue },
  ["@string.special"] = { fg = c.blue },

  -- Telescope UI (Inherits standard floating window styling)
  TelescopeNormal = { link = "Normal" },
  TelescopePromptNormal = { link = "Normal" },
  TelescopeResultsNormal = { link = "Normal" },
  TelescopePreviewNormal = { link = "Normal" },
  TelescopeBorder = { link = "FloatBorder" },
  TelescopePromptBorder = { link = "FloatBorder" },
  TelescopeResultsBorder = { link = "FloatBorder" },
  TelescopePreviewBorder = { link = "FloatBorder" },

  TelescopeMatching = { fg = c.green, bold = true }, -- Matched characters in search results
  TelescopeSelection = { fg = c.fg, bg = c.gray02 },  -- Active row highlight (optional)
  TelescopeSelectionCaret = { fg = c.green },        -- Pointer character highlight (optional)

  TelescopeResultsDirectory = { fg = c.gray05 }, -- Dims the path (e.g. lua/config/)
  TelescopeResultsFileName = { fg = c.fg },      -- Keeps trailing filename bright

  -- WhichKey UI & Background
  WhichKeyNormal = { bg = c.gray01 }, -- Float background (v3+)
  WhichKeyBorder = { link = "FloatBorder" },     -- Inherits your FloatBorder styling

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
  Folded = { fg = c.gray05, bg = c.gray01 }, -- The folded text and its background
  FoldColumn = { fg = c.gray04 },            -- The gutter where the fold arrows sit
  
  UfoFoldedFg = { fg = c.gray05 },           -- UFO specific text color
  UfoFoldedBg = { bg = c.gray01 },           -- UFO specific background color
  UfoFoldedEllipsis = { fg = c.blue },       -- The "..." indicating hidden lines
  
  UfoPreviewNormal = { link = "NormalFloat" },
  UfoPreviewBorder = { link = "FloatBorder" },
}

for name, hl in pairs(groups) do
  vim.api.nvim_set_hl(0, name, hl)
end

-- terminal ANSI colors, so :terminal / fzf / any terminal-based tool
-- matches the editor instead of the terminal's own theme
local term = {
  c.gray03, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg,
  c.gray05, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg,
}

-- for i, hex in ipairs(term) do
--   vim.g["terminal_color_" .. (i - 1)] = hex
-- end
