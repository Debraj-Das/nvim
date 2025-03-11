-- Set foldmethod to manual (Fold the files as manual)
vim.o.foldmethod = "manual"

-- Add "**" to the search path
vim.o.path = vim.o.path .. ",**"

-- set split window to open below and to the right
vim.o.splitbelow = true
vim.o.splitright = true

-- do not swap files
vim.o.swapfile = false
vim.o.backup = false

-- Set clipboard to unnamed and unnamedplus
-- vim.o.clipboard = "unnamed,unnamedplus"

-- treate the html extension file as djangohtml
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.html",
	callback = function()
		vim.bo.filetype = "html.htmldjango"
	end,
})
