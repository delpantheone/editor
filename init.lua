local home = os.getenv("HOME") or os.getenv("USERPROFILE")
local config_path = home .. "/.config/nvim"
local lua_path = config_path .. "/lua/?.lua;" .. config_path .. "/lua/?/init.lua"

if not string.find(vim.o.runtimepath, config_path, 1, true) then
	vim.opt.runtimepath:prepend(config_path)
end

package.path = package.path .. ";" .. lua_path

require("config.lazy")
