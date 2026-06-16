-- Set leaders before loading anything else!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.vscode then
  -- ==========================================
  -- 1. VSCODE MODE
  -- ==========================================
  -- VSCode handles the UI, LSP, and folding natively.
  -- We only load your core Neovim settings and keymaps.
  
  require("config.options")
  require("config.keymaps")
  
  -- If you have terminal-specific visual settings in `config.visual` 
  -- (like transparent backgrounds or lualine), DO NOT load it here.

else
  -- ==========================================
  -- 2. PURE TERMINAL NEOVIM MODE
  -- ==========================================
  -- You are in the terminal. Unleash the entire arsenal.
  
  require("config.options")
  require("config.keymaps")
  require("config.autocmds")
  require("config.folding")
  require("config.visual")

  require("plugins.lsp")
  require("plugins.editor")
  require("plugins.typst_tools")

  require("snippets.typst")
end
