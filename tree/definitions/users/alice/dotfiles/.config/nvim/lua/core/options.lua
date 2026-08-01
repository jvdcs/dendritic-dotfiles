-- Options
vim.opt.updatetime           = 1
vim.opt.regexpengine         = 0
vim.opt.clipboard            = "unnamedplus"
vim.g._ts_force_sync_parsing = true

-- Appearance (base, non-color settings -- actual theme lives in lua/theme.lua)
vim.o.termguicolors = true
vim.opt.ruler       = true
vim.opt.statusline  = "%= %f %="

-- Editing
vim.opt.wrap        = true
vim.opt.linebreak   = true
vim.opt.breakindent = true
vim.opt.showbreak   = "↪ "
vim.opt.signcolumn  = "yes"

-- Cursor
vim.opt.guicursor = {
  "n:block",   -- normal: block cursor
  "i:ver25",   -- insert: bar cursor
  "v:hor20",   -- select/visual: underline cursor
}
