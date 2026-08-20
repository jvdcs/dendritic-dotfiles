vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "[w]indow left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "[w]indow down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "[w]indow up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "[w]indow right" })
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "[w]indow move far left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "[w]indow move far down" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "[w]indow move far up" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "[w]indow move far right" })
vim.keymap.set("n", "<leader>ww", "<C-w>p", { desc = "[w]indow previous" })

-- Window Splitting
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "[w]indow split horizontal" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "[w]indow split vertical" })
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "[w]indow close" })

vim.keymap.set("n", "<leader>r", "<cmd>restart<CR>", { desc = "[r]estart nvim" })
vim.keymap.set("n", "<C-s>", "<cmd>write<CR>", { desc = "[s]ave file" })

vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "[b]uffer list" })
vim.keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "[h]elp tags" })
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "[f]ind files" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope highlights<CR>", { desc = "[s]earch highlights" })

vim.keymap.set("n", "-", "<cmd>Oil --preview<CR>", { desc = "[-] open parent directory" })
