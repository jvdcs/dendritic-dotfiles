-- Moved here from the old config/folding.lua: this sets fold-related
-- vim.opt values AND configures/binds the nvim-ufo plugin together, since
-- foldmethod="expr" only makes sense in the context of ufo's providers.
-- It belongs with plugin setup, not the vanilla-only files in lua/core/.

-- ufo setup stays exactly as you have it, minus these two lines:
-- vim.keymap.set("n", "<Tab>", "za", { silent = true })
-- local folds_open = true / vim.keymap.set("n", "<S-Tab>", ...) block — delete this whole thing

-- add fold-cycle on top
require("fold-cycle").setup({
  open_if_max_closed = true,
  close_if_max_opened = true,
})
vim.keymap.set("n", "<Tab>", function() require("fold-cycle").open() end, { silent = true })
vim.keymap.set("n", "<S-Tab>", function() require("fold-cycle").close() end, { silent = true })

-- 1. Kill the numbers on the left
vim.opt.foldcolumn = "0"
vim.opt.foldopen = ""
vim.opt.signcolumn = "yes" -- Keeps the buffer from shifting left/right

-- 2. Core options
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
-- vim.opt.foldmethod = "manual" -- problematic
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

  -- Keymaps
  vim.keymap.set("n", "zR", ufo.openAllFolds)
  vim.keymap.set("n", "zM", ufo.closeAllFolds)
  vim.keymap.set("n", "<Tab>", "za", { silent = true })
  vim.keymap.set("n", "<C-i>", "<Nop>", { silent = true })

  local folds_open = true
  vim.keymap.set("n", "<S-Tab>", function()
    if folds_open then
      ufo.closeAllFolds()
    else
      ufo.openAllFolds()
    end
    folds_open = not folds_open
  end, { silent = true })

  vim.keymap.set("n", "K", function()
    local winid = ufo.peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end)
end
