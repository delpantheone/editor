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

-- Terminal

vim.keymap.set(
	{ "n", "v" },
	"<leader>tt",
	"<Cmd>vsplit|terminal<CR>",
	{ desc = "Vertical split with a terminal buffer" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>th",
	"<Cmd>split|resize -12|terminal<CR>",
	{ desc = "Horizontal split with a terminal buffer" }
)

-- Unset highlight
vim.keymap.set({ "n", "v" }, "<Esc>", "<Cmd>nohlsearch<CR>")

-- Clear quickfix list
vim.keymap.set({ "n", "v" }, "<leader>q", "<Cmd>call setqflist([])<CR><Cmd>cclose<CR>")
