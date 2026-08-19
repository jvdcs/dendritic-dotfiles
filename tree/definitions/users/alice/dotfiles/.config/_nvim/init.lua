vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.vscode then
  require("core.options")
  require("core.keymaps")
else
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
