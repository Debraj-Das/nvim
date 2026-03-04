vim.keymap.set({"n", "v"}, "<F9>", ":w <cr> :! g++ -Wall -Wconversion -Wfatal-errors -g -std=c++17 -DLOCAL %<cr>", {buffer = true})
vim.keymap.set({"n", "v"}, "<F10>", ":!./a.out < 1.in", {buffer = true})
