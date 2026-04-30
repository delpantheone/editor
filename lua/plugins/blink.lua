return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	version = "v0.*",
	opts = {
		snippets = {
			preset = "luasnip",
		},
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },

			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<Tab>"] = {
				function(cmp)
						return cmp.select_next()
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
						return cmp.select_prev()
				end,
				"fallback",
			},
		},
		signature = { enabled = true },
		completion = {
			documentation = { auto_show = true}, --, auto_show_delay_ms = 500 },
			menu = {
				auto_show = true,
				draw = {
					treesitter = { "lsp" },
					columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
				},
			},
		},
		sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
