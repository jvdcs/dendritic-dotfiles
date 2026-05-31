vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Options
vim.opt.updatetime           = 1
vim.opt.regexpengine         = 0
vim.opt.clipboard            = "unnamedplus"
vim.g._ts_force_sync_parsing = true

-- Appearance
vim.o.termguicolors = false
vim.cmd("colorscheme default")
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Editing
vim.opt.wrap        = true
vim.opt.linebreak   = true
vim.opt.breakindent = true
vim.opt.showbreak   = "↪ "
vim.opt.signcolumn  = "yes"

-- Keymaps
map("n", "<C-Space>", function()
  local buf = vim.api.nvim_buf_get_name(0)
  vim.fn.system(
    ("tmux new-window -n 'nvim:filepicker' " ..
      "'~/.config/helix/scripts/tmux-yazi-picker.sh \"%s\"'"):format(buf)
  )
end, { silent = true })

map("n", "<A-r>", "<cmd>source $MYVIMRC<CR>", { desc = "Reload Config", silent = true })

map("n", "<leader>wc", "<cmd>bd<CR>",     { silent = true })
map("n", "<leader>wC", "<cmd>bd!<CR>",    { silent = true })
map("n", "<leader>wQ", "<cmd>q!<CR>",     { silent = true })
map("n", "<leader>wd", "<cmd>vsplit<CR>", { silent = true })

map({ "n", "v" }, "j", "gj", { silent = true })
map({ "n", "v" }, "k", "gk", { silent = true })
map("n", "<C-s>", "<cmd>w<CR>")
map("i", "<M-n>", "\\ <CR>", { silent = true })

map("i", "<BS>", function()
  local line   = vim.api.nvim_get_current_line()
  local col    = vim.api.nvim_win_get_cursor(0)[2]
  local before = line:sub(col, col)
  local after  = line:sub(col + 1, col + 1)
  local pairs  = { ["("] = ")", ["["] = "]", ["{"] = "}" }
  if pairs[before] and pairs[before] == after then
    return "<Del><BS>"
  end
  return "<BS>"
end, { expr = true, silent = true })

-- Diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix   = "●",
    severity = { min = vim.diagnostic.severity.HINT },
  },
  signs            = true,
  underline        = true,
  update_in_insert = false,
  severity_sort    = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus  = false,
      scope  = "cursor",
      border = "rounded",
    })
  end,
})

-- LSP
vim.lsp.config("lua_ls",   {})
vim.lsp.enable("lua_ls")
vim.lsp.config("tinymist", {})
vim.lsp.enable("tinymist")

-- Completion
require("blink.cmp").setup({
  keymap = {
    preset        = "none",
    ["<CR>"]      = { "accept", "fallback" },
    ["\x1ba"]     = { "select_and_accept", "fallback" },
    ["<C-space>"] = { "show", "fallback" },
    ["<C-e>"]     = { "cancel", "fallback" },
    ["<Up>"]      = { "select_prev", "fallback" },
    ["<Down>"]     = { "select_next", "fallback" },
  },
  completion = {
    list = {
      selection = {
        preselect   = false,
        auto_insert = false,
      },
    },
  },
})

-- Snippets
ls = require("luasnip")
ls.config.set_config({
  enable_autosnippets  = true,
  store_selection_keys = "<Tab>",
})

require("snippets.typst")

map({ "i", "s" }, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Cmd>TypstarSmartJump<CR>", true, false, true), "n", false
    )
  end
end, { silent = true })

map({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Cmd>TypstarSmartJumpBack<CR>", true, false, true), "n", false
    )
  end
end, { silent = true })

map("s", "<Tab>",          function() ls.jump(1)  end, { silent = true })
map({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })

-- Typstar
require("typstar").setup({
  snippets = { exclude = { "sq", "dx", "ddx", "ss" } },
})

map({ "s", "i" }, "<M-j>", "<Cmd>TypstarSmartJump<CR>")
map({ "s", "i" }, "<M-k>", "<Cmd>TypstarSmartJumpBack<CR>")
map({ "n", "i" }, "<M-t>", "<Cmd>TypstarToggleSnippets<CR>")

-- Typst Preview
require("typst-preview").setup {}

map("n", "<leader>pv", ":TypstPreview<CR>",     { desc = "Preview toggle" })
map("n", "<leader>ps", ":TypstPreviewStop<CR>", { desc = "Preview stop" })

-- Helper to check if any window in the current tab is an open Snacks picker
local function is_snacks_picker_open()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    if ft == "snacks_picker_list" or ft == "snacks_picker_input" then
      return true
    end
  end
  return false
end

-- Safely launch only once per buffer when entering
vim.api.nvim_create_autocmd("BufEnter", {
  pattern  = "*.typ",
  callback = function(args) 
    vim.schedule(function()
      -- Ensure we haven't quickly switched to another buffer before schedule fires
      if vim.api.nvim_get_current_buf() ~= args.buf then return end

      -- Gate 1: Prevent endless instance spam if it's already active
      if vim.b[args.buf].typst_preview_active then return end

      -- Gate 2: Ignore if a snacks picker layout is visible anywhere in this tab
      if is_snacks_picker_open() then return end

      -- Gate 3: Standard window/buffer safety check (floating windows, scratch buffers)
      if vim.api.nvim_win_get_config(0).relative ~= "" or vim.bo.buftype ~= "" then return end

      -- Mark as active and launch
      vim.b[args.buf].typst_preview_active = true
      vim.cmd("TypstPreview") 
    end)
  end,
})

-- Only kill the preview when the buffer is actually deleted, not just hidden
vim.api.nvim_create_autocmd("BufDelete", {
  pattern  = "*.typ",
  callback = function(args) 
    -- Reset the state flag just in case the buffer is revived later
    if vim.b[args.buf] then
      vim.b[args.buf].typst_preview_active = false
    end
    
    -- Gate 1: Don't kill the background preview if scrolling past files in picker
    if is_snacks_picker_open() then return end

    vim.cmd("TypstPreviewStop") 
  end,
})

-- Surround
require("nvim-surround").setup({
  surrounds = {
    ["("] = { add = { "(", ")" } },
    [")"] = { add = { "(", ")" } },
    ["["] = { add = { "[", "]" } },
    ["]"] = { add = { "[", "]" } },
    ["{"] = { add = { "{", "}" } },
    ["}"] = { add = { "{", "}" } },
  },
})

-- Subword Select
vim.g.VM_maps = {
  ["Find Under"]         = "<A-n>", -- Normal mode: select word under cursor
  ["Find Subword Under"] = "<A-n>", -- Visual mode: use current selection as search pattern
  ["Find Next"]          = "<A-n>", -- Add cursor to next match
  ["Find Prev"]          = "<A-N>", -- Add cursor to previous match
}

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

map("n", "<leader>a", function() 
  harpoon:list():add()
  print("Harpooned: " .. vim.api.nvim_buf_get_name(0))
end, { desc = "Harpoon Add" })

map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })

-- Changed to leader to preserve Dvorak home-row while keeping C-s for saving
map("n", "<leader>h", function() harpoon:list():select(1) end, { desc = "Harpoon Slot 1" })
map("n", "<leader>t", function() harpoon:list():select(2) end, { desc = "Harpoon Slot 2" })
map("n", "<leader>n", function() harpoon:list():select(3) end, { desc = "Harpoon Slot 3" })
map("n", "<leader>s", function() harpoon:list():select(4) end, { desc = "Harpoon Slot 4" })

-- Snacks
require("snacks").setup({
  picker = { enabled = true },
})

map("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "Find Buffers" })
map("n", "<leader>f", function() Snacks.picker.explorer() end, { desc = "Smart Find Files" })


-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover,            opts)
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition,       opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,           opts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,      opts)
    vim.keymap.set("n", "[d",        vim.diagnostic.goto_prev,     opts)
    vim.keymap.set("n", "]d",        vim.diagnostic.goto_next,     opts)
  end,
})
