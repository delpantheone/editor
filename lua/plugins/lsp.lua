return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig_util = require("lspconfig.util")

		local servers = {
			biome = {
				cmd = { "biome", "lsp-proxy" },
				root_markers = { "biome.json", "package.json", ".git" },
			},
			-- vtsls = {
			-- 	settings = {
			-- 		typescript = { format = { enable = false } },
			-- 		javascript = { format = { enable = false } },
			-- 		vtsls = {
			-- 			autoUseWorkspaceTsdk = true,
			-- 			experimental = { completion = { enableServerSideFuzzyMatch = true } },
			-- 		},
			-- 	},
			-- },
			tsgo = {
				cmd = { "tsgo", "--lsp", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_markers = { "jsconfig.json", "package.json", "pnpm-lock.yaml", "bun.lockb", ".git" },
				settings = {
					javascript = {
						implicitProjectConfig = { checkJs = true },
						format = { enable = false },
					},
					typescript = { format = { enable = false } },
				},
			},
			ruff = {
				root_markers = { "pyproject.toml", "ruff.toml", ".git" },
			},
			ty = {
				cmd = { "ty", "server" },
				filetypes = { "python" },
				root_markers = { "pyproject.toml", "setup.py", ".git" },
				settings = {
					python = {
						analysis = {
							indexing = true,
							typeCheckingMode = "standard",
						},
					},
				},
			},
			superhtml = {},
			emmet_ls = {
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			},
			tailwindcss = {
				root_markers = { "tailwind.config.js", "tailwind.config.ts", "pyproject.toml", ".git" },
			},
		}

		for name, config in pairs(servers) do
			vim.lsp.config(name, config)
			vim.lsp.enable(name)
		end
	end,
}
