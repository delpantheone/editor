vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- Window navigation

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Splitting & Resizing

vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>")
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize -2<CR>")

-- Visual indenting

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
