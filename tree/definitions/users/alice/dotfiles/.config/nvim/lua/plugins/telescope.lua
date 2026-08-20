vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/natecraddock/telescope-zf-native.nvim",
})

require("telescope").setup({
  defaults = {
    path_display = { "filename_first" }, -- Moves filename to front (bright) and puts directory after it (dimmed)
    -- layout_strategy = "horizontal", -- Options: "horizontal", "vertical", "center", "cursor"
    -- sorting_strategy = "ascending", -- Puts the search prompt at the top
    -- prompt_prefix = "🔍 ",
    selection_caret = "❯ ",
    mappings = {
      i = {
        ["<Esc>"] = require("telescope.actions").close, -- Single Esc immediately closes prompt
      },
    },
  },
  pickers = {
    help_tags = {
      show_version = true, -- Show Neovim version info in help tags preview
    },
    buffers = {
      ignore_current_buffer = true, -- Don't show the file you are already looking at
      sort_mru = true,              -- Sort by most recently used buffers
    }
  },
  extensions = {
    ["zf-native"] = {
      file = {
        enable = true,
        highlight_results = true,
        match_filename = true,
      },
      generic = {
        enable = true,
        highlight_results = true,
        match_filename = false,
      },
    }
  }
})

require("telescope").load_extension("zf-native")
