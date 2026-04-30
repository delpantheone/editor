return {
  "azratul/live-share.nvim",
  config = function()
    require("live-share").setup({
      username = "delpantheone",
    })
  end,
    vim.keymap.set( "n", "<leader>ll", "<cmd>LiveShareHostStart<cr>"),
    vim.keymap.set( "n", "<leader>ls", "<cmd>LiveShareStop<cr>"),
    vim.keymap.set( "n", "<leader>lj", ":LiveShareJoin "),
    vim.keymap.set( "n", "<leader>lf", ":LiveShareFollow "),
}
