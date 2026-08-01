local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- Use typstyle or typstfmt
    typst = { "typstyle" }, 
  },
  -- Optional: Enable format-on-save
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})
