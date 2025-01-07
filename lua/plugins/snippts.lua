return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			local snippets_path = vim.fn.stdpath('config') .. '/snippets/'
			require("luasnip.loaders.from_lua").load({paths = snippets_path})

			vim.keymap.set({"i", "s"}, "<C-n>", function() ls.jump( 1) end, {silent = true})
			vim.keymap.set({"i", "s"}, "<C-p>", function() ls.jump(-1) end, {silent = true})
		end
	}
}
