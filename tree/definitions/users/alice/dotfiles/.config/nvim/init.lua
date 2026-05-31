-- ~/.config/nvim/init.lua

-- set leaders before loading anything else!
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.lsp")
require("plugins.editor")
require("plugins.typst_tools")

require("snippets.typst")
