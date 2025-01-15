-- set the leader key
vim.g.mapleader = " "

-- Normal mode key bindings
vim.keymap.set("n", "<CR>", "o<ESC>", { desc = "Insert New Line", noremap = true })
vim.keymap.set("n", "<C-j>", ":m+1<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":m-2<CR>", { noremap = true })
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "<BS>", '"_xh', { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- Visual mode key bindings
vim.keymap.set("v", "<C-j>", ":m'>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":m'<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })
vim.keymap.set("v", "p", '"_dp', { noremap = true })

-- Insert mode key bindings
vim.keymap.set("i", "<C-j>", "<Esc>o", { noremap = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true })

-- Leader key mappings
vim.keymap.set("n", "<Leader>n", vim.cmd.tabnew, { desc = "[N]ew Tab", noremap = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- [ key bindings
vim.keymap.set("n", "<Leader>w", "<C-w>", { desc = "<C-w> alternative", noremap = true })
