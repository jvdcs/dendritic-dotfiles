vim.pack.add({
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/Bekaboo/dropbar.nvim",
})

local fzf_dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
local built = vim.uv.fs_stat(fzf_dir .. "/build/libfzf.so") or vim.uv.fs_stat(fzf_dir .. "/build/libfzf.dll")
if vim.uv.fs_stat(fzf_dir) and not built then
  if vim.fn.executable("make") == 1 then
    vim.fn.system({ "make", "-C", fzf_dir })
  else
    vim.notify("telescope-fzf-native: 'make' not found, skipping build", vim.log.levels.WARN)
  end
end

vim.keymap.set("n", "C-c", function()
  require("dropbar.api").pick()
end, { desc = "Pick breadcrumb context" })

require("dropbar").setup({
  bar = {
    truncate = true,        -- shorten winbar if it doesn't fit the window
    -- update_debounce = 32,   -- ms to wait before redrawing on rapid updates
    padding = { left = 1, right = 1 },
    pick = { pivots = "asdcnjklfvbhgzxm" }, -- keys shown in pick mode
  },
  menu = {
    -- quick_navigation = true, -- jump cursor to nearest clickable entry on move
    -- preview = true,          -- preview symbol in source window on hover
    -- hover = true,            -- highlight entry under cursor
    -- entry = { padding = { left = 1, right = 1 } },
    -- scrollbar = { enable = true, background = true },
    -- win_configs = { border = "rounded" }, -- e.g. "single" | "double" | "none"
    keymaps = {
      h = "<C-w>q", -- go back / close submenu (same as default q/<Esc>)
      l = function()
        return require("dropbar.configs").opts.menu.keymaps["<CR>"]()
      end,
    },
  },
  icons = {
    ui = {
      bar = {
        separator = "  "
      },
    },
  },
  -- sources = {
  --   path       = { max_depth = 16 }, -- max path segments shown
  --   treesitter = { max_depth = 16 },
  --   lsp        = { max_depth = 16 },
  --   markdown   = { max_depth = 6 },
  --   terminal   = { show_current = true },
  -- },
})
