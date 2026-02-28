return {
	"mistweaverco/kulala.nvim",
	opts = {},
	keys = {
		{ "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run request" },
		{ "<leader>rs", "<cmd>lua require('kulala').select_env()<cr>", desc = "Select env" },
		{ "<leader>rf", "<cmd>lua require('kulala').from_file()<cr>", desc = "Get curl command" },
	},
}
