return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome-check" },
				javascript = { "biome-check" },
				typescriptreact = { "biome-check" },
				javascriptreact = { "biome-check" },
				json = { "biome" },
				css = { "biome" },
				python = { "ruff_organize_imports", "ruff_format" },
				sql = { "sqruff" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
