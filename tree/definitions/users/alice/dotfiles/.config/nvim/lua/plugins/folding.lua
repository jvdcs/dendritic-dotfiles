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

-- Tab: Cycle open nested folds
vim.keymap.set('n', '<Tab>', function() require('fold-cycle').open() end, { silent = true })

-- Shift-Tab: Toggle all folds open/closed via UFO
local folds_open = true
vim.keymap.set('n', '<S-Tab>', function()
  local ufo = require('ufo')
  if folds_open then
    ufo.closeAllFolds()
  else
    ufo.openAllFolds()
  end
  folds_open = not folds_open
end, { silent = true })

-- 1. Kill the numbers on the left
vim.opt.foldcolumn = "0"
vim.opt.foldopen = ""
vim.opt.signcolumn = "yes" -- Keeps the buffer from shifting left/right

-- 2. Core options
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "expr" 

-- 3. Setup UFO
local status_ok, ufo = pcall(require, "ufo")
if status_ok then
  ufo.setup({
    -- THIS KILLS THE SPLIT-SECOND HIGHLIGHT FLASH
    open_fold_hl_timeout = 0, 

    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  })
end
