vim.keymap.set({"n", "v"}, "<F9>", ":! g++ -Wall -Wconversion -Wfatal-errors -g -std=c++17 -DLOCAL %<cr>", {buffer = true})
