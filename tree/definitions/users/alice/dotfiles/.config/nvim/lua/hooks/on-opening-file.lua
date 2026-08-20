vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open Telescope find_files on directory open",
  callback = function()
    local path = vim.fn.argv(0)
    if path ~= "" and vim.fn.isdirectory(path) == 1 then
      vim.schedule(function()
        require("telescope.builtin").find_files({ cwd = path })
      end)
    end
  end,
})
