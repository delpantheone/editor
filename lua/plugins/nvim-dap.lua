return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"igorlfs/nvim-dap-view",
			"mfussenegger/nvim-dap-python",
		},
		keys = {
			{ "<leader>Dt", "<cmd>DapViewToggle<cr>", mode = { "n" }, desc = "Show/Hide Dap View" },
			{ "<leader>Db", "<cmd>DapToggleBreakpoint<cr>", mode = { "n" }, desc = "Toggle breakpoint" },
			{ "<leader>Dc", "<cmd>DapContinue<cr>", mode = { "n" }, desc = "Continue Dap Flow" },
			{ "<leader>Dw", "<cmd>DapViewWatch<cr>", mode = { "n" }, desc = "Watch symbol on Dap View" },
		},
		config = function()
			require("nvim-dap-virtual-text").setup()
      require("dap-python").setup("uv")
		end,
	},
}
