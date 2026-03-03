return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig_util = require("lspconfig.util")
		local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

		local servers = {
			ruff = {
				cmd = { "ruff", "server" },
				filetypes = { "python" },
				root_dir = lspconfig_util.root_pattern(".git", "pyproject.toml", "ruff.toml"),
			},
			biome = {
				cmd = { mason_bin .. "biome", "lsp-proxy" },
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc", "css" },
				root_dir = lspconfig_util.root_pattern("biome.json", "package.json", ".git"),
			},
			vtsls = {
				cmd = { "vtsls", "--stdio" },
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
				settings = {
					typescript = { format = { enable = false } },
					javascript = { format = { enable = false } },
				},
				root_dir = lspconfig_util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
			},
			pyright = {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				root_dir = lspconfig_util.root_pattern(".git", "setup.py", "pyproject.toml"),
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			},
		}

		for name, config in pairs(servers) do
			vim.lsp.config(name, config)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = config.filetypes,
				callback = function()
					vim.lsp.start({
						name = name,
						cmd = config.cmd,
						root_dir = config.root_dir,
						settings = config.settings,
					})
				end,
			})
		end
	end,
}
