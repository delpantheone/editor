# Editor

A basic neovim config with just Lazy package manager and a theme. Also, some options and keybinds set.

It aims to be a cross-system (Linux/Windows) config

## Linux

Clone this repo with the following command:

    git clone https://github.com/delpantheone/editor.git ~/.config/nvim

## Windows

After running the command above, create a "init.lua" file on the following directory:

"%USERPROFILE%\Appdata\Local\nvim\"

It should have the following content inside:

    local home = os.getenv("HOME") or os.getenv("USERPROFILE")
    local config_path = home .. "/.config/nvim"
    local lua_path = config_path .. "/lua/?.lua;" .. config_path .. "/lua/?/init.lua"

    if not string.find(vim.o.runtimepath, config_path, 1, true) then
      vim.opt.runtimepath:prepend(config_path)
    end

    package.path = package.path .. ";" .. lua_path

    require('config.lazy')
