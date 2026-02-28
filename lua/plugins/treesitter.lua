return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false, -- Carrega o núcleo do TS imediatamente
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects", -- O lazy.nvim já deveria carregar isso
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			-- Configuração principal do Treesitter
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"luadoc",
					"make",
					"bash",
					"markdown",
					"markdown_inline",
					"dockerfile",
					"rust",
					"javascript",
					"jsdoc",
					"powershell",
					"python",
					"pymanifest",
					"json",
					"html",
					"http",
					"css",
					"typescript",
					"regex",
					"tsx",
					"sql",
					"typst",
					"vim",
				},
				sync_install = false,
				auto_install = false,
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<BS>",
					},
				},
				textobjects = { -- Aqui está a dependência
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "v",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]]"] = "@class.outer",
							["]a"] = "@parameter.outer",
							["]A"] = "@parameter.inner",
						},
						goto_next_end = { ["]F"] = "@function.outer", ["]["] = "@class.outer" },
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[["] = "@class.outer",
							["[a"] = "@parameter.outer",
							["[A"] = "@parameter.inner",
						},
						goto_previous_end = { ["[F"] = "@function.outer", ["[]"] = "@class.outer" },
					},
					swap = {
						enable = true,
						swap_next = { ["<leader>a"] = "@parameter.inner" },
						swap_previous = { ["<leader>A"] = "@parameter.inner" },
					},
					lsp_interop = {
						enable = true,
						border = "none",
						floating_preview_opts = {},
						peek_definition_code = { ["K"] = "@function.outer" },
					},
				},
			})

			-- Garante que o módulo de textobjects está carregado antes de configurar keymaps
			local status_ok, ts_repeat_move = pcall(require, "nvim-treesitter.textobjects.repeatable_move")
			if not status_ok then
				return
			end

			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
		end,
	},
}
