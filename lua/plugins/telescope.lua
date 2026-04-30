return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")

		-- Variáveis para o controle do ciclo de severidade
		local severities = { "error", "warn", "info", "hint", nil }
		local current_sev_idx = 5 -- Começa em nil (Todos)

		-- Função de Cycling
		local function cycle_severity(prompt_bufnr)
			current_sev_idx = current_sev_idx % #severities + 1
			local new_sev = severities[current_sev_idx]

			-- Reabre os diagnósticos com o novo filtro
			-- Mantém o contexto (se era buffer local ou workspace)
			builtin.diagnostics({
				severity = new_sev,
				prompt_title = "Diagnostics: " .. (new_sev or "All"),
			})
		end

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						-- M-a (Alt+A) para selecionar tudo e mandar pra Quickfix
						["<M-a>"] = require("telescope.actions").add_selected_to_qflist
							+ require("telescope.actions").open_qflist,
					},
				},
			},
			pickers = {
				diagnostics = {
					mappings = {
						i = {
							-- Atalho de cycling DENTRO do telescope
							["<C-d>"] = cycle_severity,
						},
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "LSP Symbols" })
		vim.keymap.set("n", "<leader>S", builtin.lsp_dynamic_workspace_symbols, { desc = "Dynamic Workspace Symbols" })
		vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
		-- vim.keymap.set("n", "<leader>r", builtin.lsp_references, { desc = "LSP References" })
		vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Diagnostics" })
		vim.keymap.set("n", "<leader>p", telescope.extensions.projects.projects, { desc = "List Projects" })
		vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" })

		telescope.load_extension("ui-select")
		telescope.load_extension("projects")
	end,
}
