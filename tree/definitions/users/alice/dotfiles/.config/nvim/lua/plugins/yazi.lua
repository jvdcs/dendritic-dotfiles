vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/mikavilpas/yazi.nvim",
})

require("yazi").setup({
  -- open_for_directories = true, -- true = yazi replaces netrw when you `:e` a directory
  open_multiple_tabs   = false, -- true = open all visible splits as yazi tabs
})
 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(args)
    if vim.fn.isdirectory(args.file) == 1 then
      vim.schedule(function()
        require("telescope.builtin").find_files({ 
          cwd = args.file, 
          hidden = true,
          initial_mode = "normal", -- FIX: Stops the "A" terminal escape code leak
        })
      end)
    end
  end,
})

vim.keymap.set({ "n", "v" }, "<C-space>", "<cmd>Yazi<cr>", { desc = "Open yazi at current file" })

