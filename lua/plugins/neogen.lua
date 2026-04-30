return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
            python = {
                template = {
                    annotation_convention = "google_docstrings"
                }
            },
        }
    },
    config = function(_, opts)
        require('neogen').setup(opts)

        vim.keymap.set("n", "<leader>nf", function()
            require('neogen').generate({type = "func"})
        end, { silent = true , desc = "Document a function"})

        vim.keymap.set("n", "<leader>nc", function ()
          require('neogen').generate({type = "class"})
        end, { silent = true, desc = "Document a class"})
    end,
}
