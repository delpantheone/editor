return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
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

		lint.linters = {
			biome = {
				cmd = "biome",
				args = { "check", "$FILENAME" },
				stdin = false,
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat("%f:%l:c: [%t%n] %m"),
			},
			ruff = {
				cmd = "ruff",
				args = { "--output-format=text", "--score=no", "$FILENAME" },
				stdin = false,
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat("%f:%l:c: [%t%n] %m"),
			},
			sqruff = {
				cmd = "sqruff",
				args = { "lint", "$FILENAME" },
				stdin = false,
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat("%f:%l:c: [%t%n] %m"),
			},
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
