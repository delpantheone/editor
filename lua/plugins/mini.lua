return {
	{ "nvim-mini/mini.surround", version = false, opts = {} },
	{ "nvim-mini/mini.pairs", version = false, opts = {} },
	{ "nvim-mini/mini.ai", version = false, opts = {} },
	{
		"nvim-mini/mini.jump2d",
		version = false,
		opts = {
      background = {reverse = true},
    },
		keys = {
			{ "gw", "<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>", mode = { "n" } },
		},
    vim.api.nvim_set_hl(0, 'MiniJump2dSpot', { reverse = false, bold = true, italic = true, background = 'Purple'})
	},
}
