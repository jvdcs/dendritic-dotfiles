-- Options
vim.opt.updatetime           = 1
vim.opt.regexpengine         = 0
vim.opt.clipboard            = "unnamedplus"
vim.g._ts_force_sync_parsing = true

-- Appearance
vim.o.termguicolors = false
vim.cmd("colorscheme default")
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Editing
vim.opt.wrap        = true
vim.opt.linebreak   = true
vim.opt.breakindent = true
vim.opt.showbreak   = "↪ "
vim.opt.signcolumn  = "yes"

-- Cursor (Moved from typst.lua)
vim.opt.guicursor = {
  "n:block",   -- normal: block cursor
  "i:ver25",   -- insert: bar cursor
  "v:hor20",   -- select/visual: underline cursor
}
