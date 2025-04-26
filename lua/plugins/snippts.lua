return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")
			local types = require("luasnip.util.types")
			ls.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { "←", "Error" } },
						},
					},
				},
			})
			require("luasnip.loaders.from_vscode").lazy_load()

			local snippets_path = vim.fn.stdpath("config") .. "/snippets/"
			require("luasnip.loaders.from_lua").load({ paths = snippets_path })

			vim.keymap.set({ "i" }, "<C-e>", function()
				ls.expand()
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<M-j>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<M-k>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				end
			end, { silent = true })
		end,
	},
}
