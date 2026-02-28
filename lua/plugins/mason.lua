-- lua/plugins/mason.lua
return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {
			-- Impede que o Mason baixe ferramentas automaticamente
			install_root_dir = vim.fn.stdpath("data") .. "/mason",
			pip = { install_args = { "--user" } },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
		},
		opts = {
			-- Removidos os LSPs que instalaremos via sistema ou mapearemos
			ensure_installed = {
				"ts_ls",
				"cssls",
				"html",
				"emmet_language_server",
				"pyright",
				"tinymist",
				-- "rust_analyzer", -- Instalaremos via rustup no container
			},
		},
	},
}
