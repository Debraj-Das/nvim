local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local f = ls.function_node

local go_return_values = function(args)
	return sn(nil, { t("Hell"), t("o") })
end

local time = function()
	return "funtion return"
end

ls.add_snippets("lua", {
	s(
		"efi",
		fmta(
			[[
	<val>, <err> := <f>(<args>)
	if <err_same> != nil {
			return <result>
			}
			<func>
			<finish>
	]],
			{
				val = i(1),
				err = c(2, { t("gives"), t("error") }),
				f = i(3),
				args = i(4),
				err_same = rep(1),
				result = d(5, go_return_values, { 3, 4 }),
				func = f(time, {}),
				finish = i(0),
			}
		)
	),
})
