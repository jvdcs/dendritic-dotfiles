-- lua/plugins.lua
-- vim.pack requires Neovim >= 0.12
-- :lua vim.pack.update()      -> update all
-- :lua vim.pack.del({"name"}) -> remove one

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/arne314/typstar" },
  { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/mg979/vim-visual-multi" },
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/jghauser/fold-cycle.nvim" },
  { src = "https://github.com/kevinhwang91/promise-async" },
  { src = "https://github.com/kevinhwang91/nvim-ufo" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

-- Set leaders before loading anything else!
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
