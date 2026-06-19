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
