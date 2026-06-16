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
vim.opt.foldopen = ""

vim.keymap.set("n", "<Tab>", "za", { silent = true })
vim.keymap.set("n", "<S-Tab>", function()
  if vim.wo.foldlevel == 0 then
    vim.cmd("setlocal foldlevel=99")
  else
    vim.cmd("setlocal foldlevel=0")
  end
end, { silent = true })
