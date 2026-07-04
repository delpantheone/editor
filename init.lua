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

require("config.lazy")
