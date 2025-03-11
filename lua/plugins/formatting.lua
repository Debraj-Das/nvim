return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,
				-- JS
				null_ls.builtins.formatting.prettier,
				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.djlint,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style", "{IndentWidth: 4, TabWidth: 4, UseTab: Never}" },
				}),
			},

			on_attach = function(client, bufnr)
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format()
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "formatting the current files" })
	end,
}
