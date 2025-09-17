return {
  { 'nvim-mini/mini.notify',
		version = false,
		config = function()
			require('mini.notify').setup()
		end,
	},
  { 'nvim-mini/mini.surround',
		version = false,
		config = function()
			require('mini.surround').setup()
		end,
	},
  { 'nvim-mini/mini.pairs',
		version = false,
		config = function()
			require('mini.pairs').setup()
		end,
	},
  { 'nvim-mini/mini.move',
		version = false,
		config = function()
			require('mini.move').setup()
		end,
	},
  { 'nvim-mini/mini.indentscope',
		version = false,
		config = function()
			require('mini.indentscope').setup()
		end,
	},
}
