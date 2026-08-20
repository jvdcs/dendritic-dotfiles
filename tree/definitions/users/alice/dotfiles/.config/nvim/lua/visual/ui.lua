vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
    },
  },
})

-- ============================================================================
-- RELATIVE LINE NUMBERS (ABSOLUTE ON DIAGNOSTIC LINES)
-- ============================================================================

vim.o.number = true
vim.o.relativenumber = true

_G.diagnostic_statuscol = function()
  local lnum = vim.v.lnum
  -- Fetch diagnostics on current line (convert 1-indexed lnum to 0-indexed)
  local diags = vim.diagnostic.get(0, { lnum = lnum - 1 })

  if #diags > 0 then
    return lnum -- Display absolute line number on diagnostic lines
  end

  -- Default relative number (or absolute number on the active cursor line)
  return vim.v.relnum == 0 and lnum or vim.v.relnum
end

-- %= right-aligns, %s includes signs, %{} runs our Lua function
vim.o.statuscolumn = "%=%s %{%v:lua.diagnostic_statuscol()%} "
