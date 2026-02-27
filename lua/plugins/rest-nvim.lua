return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "http", "json" })
		end,
	},
	opts = {
		rocks = {
			hererocks = false,
		},
	},
	config = function(_, opts)
		require("rest-nvim").setup(opts)

		vim.api.nvim_set_keymap("n", "<leader>rr", ":Rest run<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>rs", ":Rest env select<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>rf", ":Rest env show<CR>", { noremap = true, silent = true })
	end,
}
