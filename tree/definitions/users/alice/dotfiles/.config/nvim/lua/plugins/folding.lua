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
vim.keymap.set('n', '<S-Tab>', function() require('fold-cycle').toggle_all() end, { silent = true })

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "syntax" 

require("ufo").setup({
  open_fold_hl_timeout = 0,
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
