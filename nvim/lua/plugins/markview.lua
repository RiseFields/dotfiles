return {
    "OXY2DEV/markview.nvim",
    config = function()
        require("markview").setup({
            preview = {
                hybrid_modes = {"n"},
            }
        })
    end
}
