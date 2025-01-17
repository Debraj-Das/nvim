vim.keymap.set({ "n", "v" }, "<F9>", ":w<cr>:! python3 -u %<cr>", { buffer = true })
