return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
  keys = {
    {"<leader>tr", "<cmd>Neotest run<cr>", desc = "Run a test"},
    {"<leader>ti", "<cmd>Neotest output<cr>", desc = "Show test information"},
    {"<leader>ts", "<cmd>Neotest summary<cr>", desc = "Get test summary"},
    {"<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>", desc = "Run complete test suite"},
  },
	config = function()
		require("neotest").setup({
			settings = {
				watch = true,
			},
			adapters = {
				require("neotest-python"),
			},
		})
	end,
}
