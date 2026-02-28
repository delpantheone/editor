local home = os.getenv("HOME") or os.getenv("USERPROFILE")
local config_path = home .. "/.config/nvim"
local lua_path = config_path .. "/lua/?.lua;" .. config_path .. "/lua/?/init.lua"

if not string.find(vim.o.runtimepath, config_path, 1, true) then
	vim.opt.runtimepath:prepend(config_path)
end

-- Clipboard Windows/WSL:
if vim.fn.has("wsl") == 1 or vim.fn.has("win32") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
		paste = {
			["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard))",
			["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard))",
		},
		cache_enabled = 0,
	}
end

package.path = package.path .. ";" .. lua_path
-- Adiciona caminhos do Luarocks do sistema ao Lua do Neovim
package.path = package.path .. ";/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("~/.local/share/nvim/lazy-rocks/rest.nvim/share/lua/5.1/?.lua")
package.cpath = package.cpath .. ";/usr/lib/lua/5.1/?.so"

-- Garante que o Treesitter Textobjects seja carregado antes da config
vim.opt.runtimepath:append("~/.local/share/nvim/lazy/nvim-treesitter-textobjects")
require("config.lazy")
