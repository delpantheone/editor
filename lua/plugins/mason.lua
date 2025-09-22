return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
		},
		opts = {
			ensure_installed = { "ts_ls", "cssls", "html", "emmet_language_server", "pyright" },
		},
	},
}
