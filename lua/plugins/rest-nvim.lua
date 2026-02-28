return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	build = "luarocks install xml2lua --local && luarocks install mimetypes --local",
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
