return {
	{
		"tpope/vim-fugitive",
		enable = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		enable = false,
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
}
