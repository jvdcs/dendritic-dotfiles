local map = vim.keymap.set

map("n", "<C-Space>", function()
  local buf = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
  
  local script = string.format([[
    file=$(yazi %s --chooser-file=/dev/stdout)
    if [ -n "$file" ]; then
      tmux last-window
      tmux send-keys Escape
      tmux send-keys ":edit $(printf %%q "$file")" Enter
    fi
  ]], buf)

  -- 'sh', '-c' forces tmux to parse the multi-line string as a proper shell script
  vim.fn.system({'tmux', 'new-window', '-n', 'filepicker', 'sh', '-c', script})
end, { silent = true })

map("n", "<A-r>", "<cmd>source $MYVIMRC<CR>", { desc = "Reload Config", silent = true })

map("n", "<leader>wc", "<cmd>bd<CR>",     { silent = true })
map("n", "<leader>wC", "<cmd>bd!<CR>",    { silent = true })
map("n", "<leader>wQ", "<cmd>q!<CR>",     { silent = true })
map("n", "<leader>wd", "<cmd>vsplit<CR>", { silent = true })

map({ "n", "v" }, "j", "gj", { silent = true })
map({ "n", "v" }, "k", "gk", { silent = true })
map("n", "<C-s>", "<cmd>w<CR>")
map("i", "<M-n>", "\\ <CR>", { silent = true })

-- Backspace Pair deletion
map("i", "<BS>", function()
  local line   = vim.api.nvim_get_current_line()
  local col    = vim.api.nvim_win_get_cursor(0)[2]
  local before = line:sub(col, col)
  local after  = line:sub(col + 1, col + 1)
  local pairs  = { ["("] = ")", ["["] = "]", ["{"] = "}" }
  if pairs[before] and pairs[before] == after then
    return "<Del><BS>"
  end
  return "<BS>"
end, { expr = true, silent = true })
