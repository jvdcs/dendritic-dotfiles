vim.pack.add({
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim",      -- Required UI component library
  "https://github.com/rcarriga/nvim-notify",      -- Required for notifications
})

require("noice").setup({
  -- PADDING
  views = {
    hover = {
      border = {
        style = "rounded",
        padding = { 2, 2 }, -- 1 line top/bottom, 2 spaces left/right
      },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = { enabled = true },
    signature = { enabled = true },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true, -- Enables the border around hover/signature
  },
})
