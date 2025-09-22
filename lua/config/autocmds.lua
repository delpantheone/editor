-- Highlight yanked text

local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Keep cursor position

vim.keymap.set("n", "u", function()
	local pos = vim.api.nvim_win_get_cursor(0) -- pos = {line, column}
	vim.cmd("undo")
	local line_count = vim.api.nvim_buf_line_count(0)
	local line = math.min(pos[1], line_count)
	vim.api.nvim_win_set_cursor(0, { line, pos[2] })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-r>", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd("redo")
	local line_count = vim.api.nvim_buf_line_count(0)
	local line = math.min(pos[1], line_count)
	vim.api.nvim_win_set_cursor(0, { line, pos[2] })
end, { noremap = true, silent = true })

-- Set makeprg

local makeprgs = {
	python = "python3 %",
	javascript = "node %",
}

vim.api.nvim_create_autocmd("QuickFixCmdPre", {
  pattern = "make",
  callback = function()
    vim.fn.setqflist({}, 'r') -- Clear list before execution
  end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(makeprgs),
	callback = function(event)
		vim.bo.makeprg = makeprgs[event.match]
	end,
})
