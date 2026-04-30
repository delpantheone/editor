return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {
			install_root_dir = vim.fn.stdpath("data") .. "/mason",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
		},
		opts = {
			ensure_installed = {
				"cssls",
				"tinymist",
				"rust_analyzer",
			},
		},
	},
}
