vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], {noremap = true})
vim.keymap.set('n', '<Leader>y', '<esc>:%y+<CR>', { noremap = true })
