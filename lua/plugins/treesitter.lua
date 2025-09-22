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
				"python",
				"html",
				"css",
			},
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>", -- set to `false` to disable one of the mappings
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "v", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = true,
				},
			},
		},
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
