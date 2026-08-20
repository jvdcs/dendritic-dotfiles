vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = true          -- Enable line wrapping
vim.o.breakindent = true   -- Maintain indent level on wrapped lines
vim.o.linebreak = true     -- Break lines at words rather than hard boundaries

vim.o.tabstop = 2      -- Number of spaces that a <Tab> counts for
vim.o.shiftwidth = 2   -- Number of spaces to use for each step of indent
vim.o.softtabstop = 2  -- Number of spaces that a <Tab> counts for while performing editing operations
vim.o.expandtab = true -- Convert tabs to spaces

vim.o.number = true         -- Enable absolute line numbers
vim.o.signcolumn = "number"    -- Keep the sign gutter permanently open next to the numbers
vim.g.have_nerd_font = true
vim.o.mouse = 'a' -- enable mouse stuff 

vim.o.undofile = true -- Enable undo/redo changes even after closing and reopening a file

vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- same thing

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end) -- Sync os and nvim clipboard

vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
