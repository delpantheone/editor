return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			css = { "prettierd" },
			markdown = { "prettierd" },
			python = { "black" },
		},
		-- default_format_opts = {
		-- 	lsp_format = "fallback",
		-- },
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},

	vim.keymap.set({ "n", "v" }, "<leader>f", function()
		require("conform").format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end, { desc = "Format file or range (in visual mode)" }),
}
