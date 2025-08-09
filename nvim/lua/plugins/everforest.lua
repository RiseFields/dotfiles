return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			-- Your config here
			transparent_background_level = 1,
			-- background = "dark",
			-- colours_override = function(palette)
			-- 	palette.bg2 = "none"
			-- end,
			on_highlights = function(hl, palette)
                hl.CursorLine = {fg = palette.none, bg = palette.none}
                hl.NormalFloat = {fg = palette.fg, bg = palette.none}
                hl.Pmenu = {fg = palette.fg, bg = palette.none}
                hl.FloatBorder = {fg = palette.grey1, bg = palette.none}
			end,
		})
		vim.cmd.colorscheme("everforest")
	end,
}
