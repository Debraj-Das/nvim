local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("lua", {
	s(
		"st_luasnip",
		fmta(
			[[
local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.snippet_node

ls.add_snippets("<language>", {
	s(
		"<tigger>",
		fmta([=[
	<string>
	
	<lt>finish<gt>
		]=],
		{
			<lts>,
			<gts>,
			<field>,
		})
	),
})
<finish>
		]],
			{
				language = i(1),
				tigger = i(2),
				string = i(3),
				lt = t("<"),
				gt = t(">"),
				lts = t("lt = t('<')"),
				gts = t("gt = t('>')"),
				field = t("finish = i(0)"),
				finish = i(0),
			}
		)
	),
})
