vim.o.updatetime = 250

vim.diagnostic.config({
  virtual_lines = {
    current_line = true, -- Renders diagnostic directly under active cursor line inside editor
  },
  virtual_text = false,  -- Keeps end-of-line clutter turned off
})
