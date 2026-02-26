return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters = {
			black = {
				extra_args = { "--line-height", "88" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "biome" },
			javascript = { "biome" },
			html = { "prettierd" },
			json = { "biome" },
			css = { "biome" },
			markdown = { "prettierd" },
			python = { "black" },
			sql = { "sqruff" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},

	vim.keymap.set({ "n", "v" }, "<leader>cf", function()
		require("conform").format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end, { desc = "Format file or range (in visual mode)" }),
}
