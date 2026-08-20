vim.pack.add({"https://github.com/stevearc/oil.nvim"})

require("oil").setup({
  default_file_explorer = false, -- Replaces Neovim's default netrw explorer
  -- skip_confirm_for_simple_edits = false, -- Set true to instantly apply file changes on save without asking
  -- view_options = {
  --   show_hidden = false,        -- Toggle hidden files (can also press 'gH' while inside Oil)
  -- },
  columns = {
    -- "permissions", -- Mode flags (e.g. -rw-r--r--)
    "size",        -- Human-readable file size (e.g. 4.2k)
    "mtime",       -- Last modified timestamp
    "icon",
  },
  float = {
    padding = 2,
    border = "rounded", -- Options: "single" | "double" | "rounded" | "solid" | "shadow"
    max_width = 100,
    max_height = 30,
    preview_split = "right", -- Direction of preview window ("right", "left", "above", "below")
  },
  preview_win = {
    border = "rounded", -- Border style for the live preview window (<C-p>)
    update_on_cursor_moved = true,   -- Auto-updates floating preview on cursor move
    preview_method = "fast_scratch",  -- Fast lightweight preview mode
  },
  keymaps = {
    ["-"] = "actions.parent",
    ["<Esc>"] = "actions.close",     -- Pressing Escape inside closes Oil and its preview window
    ["<C-space>"] = "actions.close", -- Opens selected file or enters directory cleanly
    -- ["<C-p>"] = "actions.preview", -- Toggles preview on/off manually
  },
  -- Built-in keymaps inside oil buffer:
  -- <C-p> : Toggles live file preview window
  -- <C-h> : Toggles hidden files/dotfiles
  -- <C-l> : Refreshes directory buffer
})
