return {
    'stevearc/oil.nvim',
    lazy = false,
    config = function()
        require("oil").setup({
            columns = {
                "size"
            },
            view_options = {
                show_hidden = true
            }
        })
        vim.keymap.set("n", "<leader>mv", ":Oil<CR>")
    end
}
