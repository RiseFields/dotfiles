return {
    "nvim-lualine/lualine.nvim",
    config = function()
        vim.opt.laststatus = 2
        -- local theme = require("lualine.themes.auto")
        local theme = require("lualine.themes.onedark")

        theme.normal.c.bg = "None"
        theme.insert.a.bg = "#6cb6eb"

        require("lualine").setup({
            options = {
                theme = theme,
                component_seperator = { left = "\\ue0b0", right = "\\ueb2" },
                section_seperator = { left = "\\ue0b1", right = "\\ue0b3" },
                icons_enabled = true,
            },
            sections = { lualine_c = { 'filename', 'searchcount' }, lualine_x = { 'encoding', 'fileformat', 'progress' }, lualine_y = { 'filetype', 'lsp_status' } }
        })

        -- Set background of statusline to transparant
        vim.api.nvim_set_hl(0, "StatusLine", {bg = "none" })
    end,
}
