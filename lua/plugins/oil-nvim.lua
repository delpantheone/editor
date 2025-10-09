return {
	{ "stevearc/oil.nvim", opts = {}, dependencies = { { "echasnovski/mini.icons", opts = {} } }, lazy = false },

	vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "File manager (CWD)" }),
}
