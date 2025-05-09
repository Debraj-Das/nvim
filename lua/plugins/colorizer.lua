return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = { -- set to setup table
	},
	config = function()
		require("colorizer").setup({
			user_default_options = {
				names = false, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
				names_opts = { -- options for mutating/filtering names.
					lowercase = true, -- name:lower(), highlight `blue` and `red`
					camelcase = true, -- name, highlight `Blue` and `Red`
					uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
					strip_digits = false, -- ignore names with digits,
					-- highlight `blue` and `red`, but not `blue3` and `red4`
				},
			},
		})
	end,
}
