vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.opt.foldmethod     = "expr"
vim.opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel      = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn     = "0"
vim.opt.foldenable     = true

vim.keymap.set("n", "<S-Tab>", function()
  local line = vim.fn.line(".")
  if vim.fn.foldlevel(line) == 0 then return end
  if vim.fn.foldclosed(line) ~= -1 then
    vim.cmd("normal! zo")
  else
    vim.cmd("normal! zc")
  end
end, { desc = "Toggle fold under cursor" })
