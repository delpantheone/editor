# Editor

My neovim setup with Lazy package manager and some plugins. Also, some options and keyboard shortcuts are defined.

This is intended to be a multi-system (Linux/Windows) setup.

## Linux

Clone repo with the following command:

    git clone https://github.com/delpantheone/editor.git ~/.config/nvim

## Windows

After running the above command, create an "init.lua" file in the following directory:

"%USERPROFILE%\Appdata\Local\nvim\"

It should have the following contents:

    local home = os.getenv("HOME") or os.getenv("USERPROFILE")
    local config_path = home .. "/.config/nvim"
    local lua_path = config_path .. "/lua/?.lua;" .. config_path .. "/lua/?/init.lua"

    if not string.find(vim.o.runtimepath, config_path, 1, true) then
      vim.opt.runtimepath:prepend(config_path)
    end

    package.path = package.path .. ";" .. lua_path

    require('config.lazy')
