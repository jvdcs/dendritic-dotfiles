vim.opt.ruler = true
vim.opt.statusline = "%= %f %="

-- ============================================================
-- Custom colorscheme (ported exactly from Helix theme)
-- Must have termguicolors for hex colors to work
-- ============================================================
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
vim.g.colors_name = "mytheme"

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor UI ─────────────────────────────────────────────────────────────
hl("Normal",        { fg = c.fg,     bg = c.bg })
hl("NormalFloat",   { fg = c.fg,     bg = c.gray01 })
hl("FloatBorder",   { fg = c.gray03, bg = c.gray01 })
hl("Cursor",        { fg = c.black,  bg = c.white })    -- ui.cursor.primary
hl("CursorLine",    { bg = c.gray01 })
hl("CursorLineNr",  { fg = c.fg })                      -- ui.linenr.selected
hl("LineNr",        { fg = c.gray03 })                  -- ui.linenr
hl("SignColumn",    { bg = c.bg })
hl("ColorColumn",   { bg = c.gray02 })
hl("VertSplit",     { fg = c.gray03 })                  -- ui.window
hl("WinSeparator",  { fg = c.gray03 })                  -- ui.window
hl("Folded",        { fg = c.gray05, bg = c.gray01 })
hl("EndOfBuffer",   { fg = c.gray03 })
hl("NonText",       { fg = c.gray03 })
hl("SpecialKey",    { fg = c.gray03 })
hl("Whitespace",    { fg = c.gray03 })
hl("Directory",     { fg = c.gray05 })                  -- ui.text.directory
hl("Conceal",       { fg = c.gray05 })

-- ── Selection / Search ────────────────────────────────────────────────────
hl("Visual",     { fg = c.white, bg = c.gray03 })       -- ui.selection
hl("Search",     { fg = c.fg,    bg = c.gray01 })       -- ui.highlight
hl("IncSearch",  { fg = c.black, bg = c.white })        
hl("CurSearch",  { fg = c.black, bg = c.white })
hl("MatchParen", { fg = c.white, bg = c.gray04, bold = false }) -- Fixed: Prevent Nvim's default bolding
hl("Substitute", { fg = c.black, bg = c.yellow })

-- ── Statusline / Tabline ──────────────────────────────────────────────────
hl("StatusLine",   { fg = c.fg,     bg = c.gray02 })    -- ui.statusline
hl("StatusLineNC", { fg = c.gray05, bg = c.gray01 })    -- ui.statusline.inactive
hl("TabLine",      { fg = c.gray04, bg = c.bg })        -- ui.bufferline.background
hl("TabLineSel",   { fg = c.fg,     bg = c.gray02 })    -- ui.bufferline.active
hl("TabLineFill",  { bg = c.bg })

-- ── Popups / Completion ───────────────────────────────────────────────────
hl("Pmenu",      { fg = c.fg,  bg = c.gray02 })         -- ui.menu
hl("PmenuSel",   { fg = c.bg,  bg = c.fg })             -- ui.menu.selected
hl("PmenuSbar",  { bg = c.gray02 })
hl("PmenuThumb", { bg = c.gray04 })                     -- ui.menu.scroll

-- ── Messages ──────────────────────────────────────────────────────────────
hl("ErrorMsg",   { fg = c.red })
hl("WarningMsg", { fg = c.yellow })
hl("MoreMsg",    { fg = c.green })
hl("Question",   { fg = c.green })

-- ── Diagnostics ───────────────────────────────────────────────────────────
hl("DiagnosticError",          { fg = c.red,    italic = true })
hl("DiagnosticWarn",           { fg = c.yellow, italic = true })
hl("DiagnosticInfo",           { fg = c.blue,   italic = true })
hl("DiagnosticHint",           { fg = c.green,  italic = true })
hl("DiagnosticUnderlineError", { sp = c.red,    undercurl = true })
hl("DiagnosticUnderlineWarn",  { sp = c.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo",  { sp = c.blue,   undercurl = true })
hl("DiagnosticUnderlineHint",  { sp = c.green,  undercurl = true })
hl("DiagnosticUnnecessary",    { fg = c.fg,     bg = c.bg, sp = c.yellow, underline = true })

-- ── Classic Syntax Groups ─────────────────────────────────────────────────
hl("Comment",         { fg = c.gray04, italic = true })
hl("Constant",        { fg = c.magenta })
hl("String",          { fg = c.cyan,   italic = true })
hl("Character",       { fg = c.magenta })
hl("Number",          { fg = c.magenta })
hl("Float",           { fg = c.magenta })
hl("Boolean",         { fg = c.magenta })
hl("Identifier",      { fg = c.fg })
hl("Function",        { fg = c.green })
hl("Statement",       { fg = c.gray06 })
hl("Keyword",         { fg = c.gray06 })
hl("Conditional",     { fg = c.gray06 })
hl("Repeat",          { fg = c.gray06 })
hl("Label",           { fg = c.gray06 })
hl("Operator",        { fg = c.gray06, italic = true })
hl("Exception",       { fg = c.gray06 })
hl("PreProc",         { fg = c.gray06 })
hl("Include",         { fg = c.gray06 })
hl("Define",          { fg = c.gray06 })
hl("Macro",           { fg = c.green,  italic = true })
hl("Type",            { fg = c.blue })
hl("StorageClass",    { fg = c.gray06 })
hl("Structure",       { fg = c.blue })
hl("Typedef",         { fg = c.blue })
hl("Special",         { fg = c.green,  italic = true })   
-- FIXED: Set broad standard Delimiter to gray04 so parens catch it gracefully if TS isn't perfectly mapped
hl("Delimiter",       { fg = c.gray04 })                      
hl("SpecialComment",  { fg = c.gray04, italic = true })
hl("Error",           { fg = c.red })
hl("Todo",            { fg = c.green,  italic = true })
hl("Underlined",      { underline = true })

-- ── Treesitter @ Groups ───────────────────────────────────────────────────
hl("@comment",               { fg = c.gray04, italic = true })
hl("@comment.block",         { fg = c.gray04, italic = true })
hl("@comment.documentation", { fg = c.gray04, italic = true })
hl("@comment.line",          { fg = c.gray04, italic = true })

hl("@constant",              { fg = c.magenta })
hl("@constant.builtin",      { fg = c.magenta })
hl("@boolean",               { fg = c.magenta })
hl("@number",                { fg = c.magenta })
hl("@number.float",          { fg = c.magenta })
hl("@character",             { fg = c.magenta })
hl("@character.special",     { fg = c.magenta })

hl("@string",                { fg = c.cyan, italic = true })
hl("@string.regexp",         { fg = c.blue })
hl("@string.escape",         { fg = c.magenta }) 
hl("@string.special",        { fg = c.blue })

hl("@function",              { fg = c.green })
hl("@function.builtin",      { fg = c.green, underline = true })
hl("@function.macro",        { fg = c.green, italic = true })
hl("@function.method",       { fg = c.green, underline = true })
hl("@function.call",         { fg = c.green })
hl("@constructor",           { fg = c.blue })

hl("@keyword",               { fg = c.gray06 })
hl("@keyword.function",      { fg = c.gray06 })
hl("@keyword.operator",      { fg = c.gray06 }) 
hl("@keyword.return",        { fg = c.gray06 })

hl("@operator",              { fg = c.gray06, italic = true })

-- FIXED: Explicitly covered all brackets/punctuation fallbacks for tree-sitter
hl("@punctuation",           { fg = c.gray04 }) -- General punctuation fallback
hl("@punctuation.bracket",   { fg = c.gray04 }) -- Parenthesis & brackets
hl("@punctuation.delimiter", { fg = c.fg })     -- Commas, semicolons, etc
hl("@punctuation.special",   { fg = c.fg })     -- Macros, hashes, etc

hl("@type",                  { fg = c.blue })
hl("@type.builtin",          { fg = c.blue })

hl("@variable",              { fg = c.fg })
hl("@variable.builtin",      { fg = c.blue, italic = true })
hl("@variable.member",       { fg = c.blue })
hl("@variable.parameter",    { fg = c.fg,   italic = true })

hl("@module",                { fg = c.fg, underline = true }) 
hl("@namespace",             { fg = c.fg, underline = true })
hl("@attribute",             { fg = c.green, italic = true }) 
hl("@label",                 { fg = c.gray06 })

hl("@tag",                   { fg = c.fg })
hl("@tag.attribute",         { fg = c.fg })
hl("@tag.delimiter",         { fg = c.gray04 })

-- Typst/Math specific fallback just in case
hl("@markup.math",           { fg = c.fg })

-- ── LSP Semantic Tokens ───────────────────────────────────────────────────
hl("@lsp.type.function",   { link = "@function" })
hl("@lsp.type.method",     { link = "@function.method" })
hl("@lsp.type.variable",   { link = "@variable" })
hl("@lsp.type.parameter",  { link = "@variable.parameter" })
hl("@lsp.type.keyword",    { link = "@keyword" })
hl("@lsp.type.type",       { link = "@type" })
hl("@lsp.type.namespace",  { link = "@module" })
hl("@lsp.type.macro",      { link = "@function.macro" })
hl("@lsp.type.comment",    { link = "@comment" })
hl("@lsp.type.string",     { link = "@string" })
hl("@lsp.type.number",     { link = "@number" })
hl("@lsp.type.property",   { link = "@variable.member" })
