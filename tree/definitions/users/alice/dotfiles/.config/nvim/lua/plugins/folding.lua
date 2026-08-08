vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'jghauser/fold-cycle.nvim',
    config = function()
      require('fold-cycle').setup()
    end
  }
end)

vim.keymap.set('n', '<Tab>', function() require('fold-cycle').open() end, { silent = true })
vim.keymap.set('n', '<S-Tab>', function() require('fold-cycle').close() end, { silent = true })
vim.keymap.set('n', 'za', function() require('fold-cycle').toggle_all() end, { silent = true })

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "syntax" 

-- 1. Initialize the plugin setup
require("ufo").setup({
  open_fold_hl_timeout = 0,
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

-- 2. Define the toggle state and mapping right below it
local ufo = require('ufo')
local all_folds_closed = false

vim.keymap.set('n', 'zA', function()
    if all_folds_closed then
        ufo.openAllFolds()
        all_folds_closed = false
    else
        ufo.closeAllFolds()
        all_folds_closed = true
    end
end, { desc = "Toggle all folds" })
