vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<leader>ww", "<C-w>p", { desc = "Go to last accessed window" })
-- Window Splitting
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wd", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "Close window" })

vim.keymap.set("n", "<leader>r", "<cmd>restart<CR>", { desc = "[r]estart nvim" })
vim.keymap.set("n", "<C-s>", "<cmd>write<CR>", { desc = "[s]ave file" })

vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "[b]uffer list" })
vim.keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "[h]elp list" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope highlights<CR>", { desc = "Search highlight groups" })

vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "-", "<cmd>Oil --preview<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-space>", "<cmd>Oil --float --preview<CR>", { desc = "Open parent directory" })
