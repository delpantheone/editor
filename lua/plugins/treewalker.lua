return {
  "aaronik/treewalker.nvim",
  opts = {
    highlight = true,
  },
  keys = {
    { "<M-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" } },
    { "<M-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" } },
    { "<M-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" } },
    { "<M-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" } },
    { "<M-S-j>", "<cmd>Treewalker SwapDown<cr>", mode = {"n"}},
    { "<M-S-k>", "<cmd>Treewalker SwapUp<cr>", mode = {"n"}},
    { "<M-S-h>", "<cmd>Treewalker SwapLeft<cr>", mode = {"n"}},
    { "<M-S-l>", "<cmd>Treewalker SwapRight<cr>", mode = {"n"}},
  }
}
