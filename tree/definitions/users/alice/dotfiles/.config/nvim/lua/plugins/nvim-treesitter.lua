-- 1. Install & load plugin via vim.pack
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

-- 2. Configure Treesitter core setup
local ts = require('nvim-treesitter')

ts.setup({
  -- Directory to store parsers
  -- install_dir = vim.fn.stdpath('data') .. '/site',
})

-- Install desired parsers
ts.install({ 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' })

-- Enable treesitter highlighting and indentation on buffer load
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    -- Native treesitter highlighting
    pcall(vim.treesitter.start)

    -- Native treesitter indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
