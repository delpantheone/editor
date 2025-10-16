return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"regex",
				"bash",
				"markdown",
				"markdown_inline",
				"typescript",
				"javascript",
				"jsdoc",
				"luadoc",
				"python",
				"pymanifest",
				"html",
				"css",
				"sql",
			},
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
