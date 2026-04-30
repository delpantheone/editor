vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- Window navigation

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Terminal Window Navigation

vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>")

-- Splitting & Resizing

vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize -2<CR>")

-- Visual indenting

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Unset highlight

vim.keymap.set({ "n", "v" }, "<C-c>", "<Cmd>nohlsearch<CR>")

-- Clear quickfix list

vim.keymap.set({ "n", "v" }, "<leader>cq", "<Cmd>call setqflist([])<CR><Cmd>cclose<CR>")
