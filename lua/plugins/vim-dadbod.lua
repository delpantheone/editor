return {
	{ "tpope/vim-dadbod" },
	-- { "kristijanhusak/vim-dadbod-completion" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		keys = {
			{ "<leader>du", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
			{ "<leader>da", "<cmd>DBUIAddConnection<CR>", desc = "Add database connection" },
			{ "<leader>df", "<cmd>DBUIFindBuffer<CR><cmd>DBUIToggle<CR><cmd>edit %<CR>", desc = "Find db buffer" },
		},
	},
}
