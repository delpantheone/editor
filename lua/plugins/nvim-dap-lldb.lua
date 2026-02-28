-- lua/plugins/nvim-dap-lldb.lua
return {
	"julianolf/nvim-dap-lldb",
	dependencies = { "mfussenegger/nvim-dap" },
	opts = {
		-- Aponta para o binário LLDB instalado via apk no Dockerfile
		codelldb_path = "/usr/bin/lldb-vscode",
	},
}
