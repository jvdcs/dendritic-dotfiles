local status_ok, autopairs = pcall(require, "nvim-autopairs")
if status_ok then
  -- 1. Enable the Enter map feature globally
  autopairs.setup({
    map_cr = true,
  })

  -- 2. NUKE all the default rules (stops it from auto-closing quotes/brackets on type)
  autopairs.clear_rules()

  -- 3. Add back passive rules for the brackets.
  -- This tells the plugin: "Don't auto-insert the closing bracket when I type,
  -- but look for them when I press Enter so you can format it cleanly."
  local Rule = require("nvim-autopairs.rule")

  autopairs.add_rules({
    Rule("(", ")"):with_pair(function() return false end),
    Rule("{", "}"):with_pair(function() return false end),
    Rule("[", "]"):with_pair(function() return false end),
  })
end

-- Backspace Pair deletion
-- (moved here from core/keymaps.lua -- this is the same "pairs" concern as
-- the rules above, just the deletion half of it, so it belongs in this file)
vim.keymap.set("i", "<BS>", function()
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
