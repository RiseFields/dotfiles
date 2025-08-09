return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    dependencies = {
        -- Required
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "thesis",
                    path = [[~/Documents/Unif/Thesis - 20sp/Notes]]
                },
            },
            completion = {
                nvim_cmp = true,
                nim_chars = 2,
            },
            ui = {
                enable = false
            }
        })
    end
}
