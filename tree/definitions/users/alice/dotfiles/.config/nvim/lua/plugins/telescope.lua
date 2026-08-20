vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })

require("telescope").setup({
  defaults = {
    -- layout_strategy = "horizontal", -- Options: "horizontal", "vertical", "center", "cursor"
    -- sorting_strategy = "ascending", -- Puts the search prompt at the top
    -- prompt_prefix = "🔍 ",
    -- selection_caret = "❯ ",
  },
  pickers = {
    help_tags = {
      show_version = true, -- Show Neovim version info in help tags preview
    },
    buffers = {
      ignore_current_buffer = true, -- Don't show the file you are already looking at
      sort_mru = true,              -- Sort by most recently used buffers
    }
  }
})
