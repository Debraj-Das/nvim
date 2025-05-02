return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin-mocha")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "green", bold = false })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "green", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "green", bold = false })
	end,
}
