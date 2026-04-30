return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install("curl")
	end,
	config = function()
		require("dbee").setup()
	end,
	keys = {
		{ "<leader>u", "<cmd>Dbee toggle<CR>", desc = "Toggle DBUI" },
	},
}
