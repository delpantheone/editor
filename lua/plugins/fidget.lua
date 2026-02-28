return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = "LspAttach",
	opts = {
		notification = {
			window = {
				winblend = 0, -- transparente para harmonizar com noice
				border = "rounded",
			},
		},
	},
}
