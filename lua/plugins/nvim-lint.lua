return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			typescript = { "biome" },
			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			python = { "ruff" },
			sql = { "sqruff" },
		}

		lint.linters.biome = vim.tbl_deep_extend("force", lint.linters.biome or {}, {
			cmd = "biome",
			args = { "check", "--unsafe" },
		})

		lint.linters.ruff = vim.tbl_deep_extend("force", lint.linters.ruff or {}, {
			cmd = "ruff",
			args = { "check", "--force-exclude", "--output-format=text" },
		})

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint(nil, { ignore_errors = true })
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
