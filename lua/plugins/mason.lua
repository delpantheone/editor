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
				"vtsls",
				"cssls",
				"html",
				"pyright",
				"emmet_language_server",
				"tinymist",
				"rust_analyzer",
			},
		},
	},
}
