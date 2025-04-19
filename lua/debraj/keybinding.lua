vim.keymap.set(
	"n",
	"<leader>sb",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "[S]u[B]stitude Current word", noremap = true }
)

vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>ko", { noremap = true })
vim.keymap.set("i", "(<CR>", "(<CR>)<Esc>ko", { noremap = true })
vim.keymap.set("n", "<leader>v", "ggVG", { desc = "Whole [V]isual select", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank to Clipboard", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "[P]aste from Clipboard", noremap = true })
