vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local ts = require('nvim-treesitter')
ts.setup({
  -- Directory to store parsers
  -- install_dir = vim.fn.stdpath('data') .. '/site',
})

ts.install({ 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'toml' })

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Native treesitter highlighting
    pcall(vim.treesitter.start)

    -- Native treesitter indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
