
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

ls.add_snippets("cpp", {
	s(
		"rng",
		fmta([=[
std::mt19937 random_number_generator(
    std::chrono::steady_clock::now().time_since_epoch().count());

inline int rng(int l = 0, int r = 1e9) {
    if (l <gt> r) {
        swap(l, r);
    }

    return std::uniform_int_distribution<lt>int<gt>(l, r)(random_number_generator);
}
<finish>
		]=],
		{
			lt = t('<'),
			gt = t('>'),
			finish = i(0),
		})
	),
})
