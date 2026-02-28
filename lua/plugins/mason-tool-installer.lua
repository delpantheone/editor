-- lua/plugins/mason-tool-installer.lua
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			"stylua",
			"biome",
			"prettierd",
			-- "black", -- Já instalado no Alpine
			"pylint",
			"sqruff",
		},
	},
}
