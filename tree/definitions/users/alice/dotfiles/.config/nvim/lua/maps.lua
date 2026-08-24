vim.g.mapleader = " "
vim.g.maplocalleader = " "

local S = vim.keymap.set
-- Window Navigation
S("n", "<leader>wh", "<C-w>h", { desc = "[w]indow left" })
S("n", "<leader>wj", "<C-w>j", { desc = "[w]indow down" })
S("n", "<leader>wk", "<C-w>k", { desc = "[w]indow up" })
S("n", "<leader>wl", "<C-w>l", { desc = "[w]indow right" })
S("n", "<leader>wH", "<C-w>H", { desc = "[w]indow move left" })
S("n", "<leader>wJ", "<C-w>J", { desc = "[w]indow move down" })
S("n", "<leader>wK", "<C-w>K", { desc = "[w]indow move up" })
S("n", "<leader>wL", "<C-w>L", { desc = "[w]indow move right" })
S("n", "<leader>ww", "<C-w>p", { desc = "[w]indow previous" })

-- Window Splitting
S("n", "<leader>ws", "<C-w>s", { desc = "[w]indow split down" })
S("n", "<leader>wd", "<C-w>v", { desc = "[w]indow split left" })

S("n", "<leader>R", "<cmd>restart<CR>", { desc = "[r]estart nvim" })
S("n", "<leader>r", vim.lsp.buf.rename, { desc = "[r]ename variable" })
S("n", "<C-s>", "<cmd>write<CR>", { desc = "[s]ave file" })

S("n", "-", "<cmd>Oil --preview<CR>", { desc = "[-] open parent directory" })

S("n", "<C-g>", function()
	require("dropbar.api").pick()
end, { desc = "Pick breadcrumb context" })

S("n", "<leader>cd", "<cmd>cd %:p:h<CR>", { desc = "CD to buffer" })
S("n", "<leader>cl", "<cmd>lcd %:p:h<CR>", { desc = "LCD to buffer" })

S({ "n", "v" }, "<C-space>", "<cmd>Yazi<cr>", { desc = "Open yazi at current file" })

-- UFO Folding API (Uncomment and assign keys as needed)
S("n", "<C-h>", "zc", { desc = "Close current fold" })
S("n", "<C-l>", "zo", { desc = "Open current fold" })

local all_folds_closed = false
local function toggle_all_folds()
	if all_folds_closed then
		require("ufo").openAllFolds()
	else
		require("ufo").closeAllFolds()
	end
	all_folds_closed = not all_folds_closed
end
S("n", "<C-f>", toggle_all_folds, { desc = "Toggle all folds" })

-- vim.keymap.set("c", "<Down>", "<C-n>", { desc = "Next command line suggestion" })
-- vim.keymap.set("c", "<Up>", "<C-p>", { desc = "Previous command line suggestion" })
-- vim.opt.wildmenu = true            -- Enable command-line completion menu
-- vim.opt.wildoptions = "pum"        -- Display suggestions as a vertical popup menu
-- vim.opt.wildmode = "full"          -- Command completion mode behavior
