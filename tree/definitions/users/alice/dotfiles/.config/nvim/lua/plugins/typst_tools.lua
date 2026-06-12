local map = vim.keymap.set

-- Mini.ai (Moved from typst.lua)
require('mini.ai').setup({
  custom_textobjects = {
    ['$'] = require('mini.ai').gen_spec.pair('$', '$', { type = 'non-balanced' }),
  },
})

-- Typstar
require("typstar").setup({
  snippets = {
    exclude = {
      "sq", "dx", "ddx", "ss", "int", "dint",
      "sp", "su", "ub", "sub",
      "le", "gt",
      "_", "sum"
    },
    visual_disable_postfix = {
      "ub" 
    }
  }
})

map({ "s", "i" }, "<M-j>", "<Cmd>TypstarSmartJump<CR>")
map({ "s", "i" }, "<M-k>", "<Cmd>TypstarSmartJumpBack<CR>")
map({ "n", "i" }, "<M-t>", "<Cmd>TypstarToggleSnippets<CR>")

-- Typst Preview Setup & Keymaps
require("typst-preview").setup {}
map("n", "<leader>pv", ":TypstPreview<CR>",     { desc = "Preview toggle" })
map("n", "<leader>ps", ":TypstPreviewStop<CR>", { desc = "Preview stop" })

-- Helper to check if any window in the current tab is an open Snacks picker
local function is_snacks_picker_open()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    if ft == "snacks_picker_list" or ft == "snacks_picker_input" then
      return true
    end
  end
  return false
end

-- Safely launch only once per buffer when entering
vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
  pattern  = "*.typ",
  callback = function(args) 
    vim.schedule(function()
      if vim.api.nvim_get_current_buf() ~= args.buf then return end
      if vim.b[args.buf].typst_preview_active then return end
      if is_snacks_picker_open() then return end
      if vim.api.nvim_win_get_config(0).relative ~= "" or vim.bo.buftype ~= "" then return end

      vim.b[args.buf].typst_preview_active = true
      vim.cmd("TypstPreview") 
    end)
  end,
})

-- Only kill the preview when the buffer is actually deleted, not just hidden
vim.api.nvim_create_autocmd("BufDelete", {
  pattern  = "*.typ",
  callback = function(args) 
    if vim.b[args.buf] then
      vim.b[args.buf].typst_preview_active = false
    end
    
    if is_snacks_picker_open() then return end
    vim.cmd("TypstPreviewStop") 
  end,
})
