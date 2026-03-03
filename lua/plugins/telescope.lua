return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope-ui-select.nvim" },
	opts = {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.lsp_document_symbols, { desc = "LSP Symbols" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
		vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Dynamic Workspace Symbols" })
		vim.keymap.set("n", "<leader>fe", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "LSP References" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

		require("telescope").load_extension("ui-select")
	end,
}
