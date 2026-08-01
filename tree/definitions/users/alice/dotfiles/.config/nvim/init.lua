-- Set leaders before loading anything else!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.vscode then
  -- ==========================================
  -- 1. VSCODE MODE
  -- ==========================================
  -- VSCode handles the UI, LSP, and folding natively.
  -- We only load your core Neovim settings and keymaps.

  require("core.options")
  require("core.keymaps")

else
  -- ==========================================
  -- 2. PURE TERMINAL NEOVIM MODE
  -- ==========================================
  -- NOTE ON PLUGIN INSTALLATION: this file assumes plugins are already on
  -- 'runtimepath' by the time init.lua runs (e.g. installed via Nix, as you
  -- currently do). If you ever move to vim.pack instead, add a single
  -- `vim.pack.add({...})` call right here, above everything else, and the
  -- rest of this file needs no changes -- every require() below just needs
  -- the plugin present on runtimepath, it doesn't care how it got there.

  require("core.options")
  require("core.keymaps")
  require("core.autocmds")
  require("theme")

  require("plugins.folding")
  require("plugins.lsp")
  require("plugins.completion")
  require("plugins.editor")
  require("plugins.autopairs")
  require("plugins.formatting")

  require("lang.typst")
  require("lang.typst.snippets")
end
