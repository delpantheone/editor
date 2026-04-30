return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			detection_methods = { "lsp", "pattern" },

			patterns = {
				".git",
				"_darcs",
				".hg",
				".bzr",
				".svn",
				"Makefile",
				"package.json",
				"pyproject.toml",
				"biome.json",
				"setup.py",
			},

			exclude_dirs = { "~/.cargo/*", "node_modules/*" },

			manual_mode = false,
		})
	end,
}
