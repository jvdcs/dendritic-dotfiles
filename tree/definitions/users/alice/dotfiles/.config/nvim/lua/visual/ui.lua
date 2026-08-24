vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
  },
})

-- Map severity integers (1-4) directly to highlight groups
local diag_hl = { "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint" }

_G.diagnostic_statuscol = function()
  local lnum, relnum = vim.v.lnum, vim.v.relnum
  local diags = vim.diagnostic.get(0, { lnum = lnum - 1 })

  -- 1. Number: Absolute if it has diagnostics or is the current line, else relative
  local num = (#diags > 0 or relnum == 0) and lnum or relnum

  -- 2. Highlight: Diagnostic Color -> CursorLine Color -> Default Color
  local hl = #diags > 0 and diag_hl[diags[1].severity] or (relnum == 0 and "CursorLineNr" or "LineNr")

  -- 3. String formatting: Right-align, apply color, number, reset color, space, sign column
  return string.format("%%=%%#%s#%d%%* %%s", hl, num)
end

vim.o.statuscolumn = "%!v:lua.diagnostic_statuscol()"
