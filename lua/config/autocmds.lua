-- Highlight yanked text

local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = hightlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = "200",
    })
  end,
})
