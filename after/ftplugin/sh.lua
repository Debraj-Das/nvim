vim.keymap.set("n", "<F9>", ":w<cr>:! ./%<cr>", { buffer = true })
vim.keymap.set("n", "<A-x>", ":! chmod u+x %<cr>", { buffer = true })
