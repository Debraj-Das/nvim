
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
		"divisor",
		fmta([=[
const int N = 1e7 + 1;
int divisor[N] = {0};

void primeDivisor()
{
    divisor[1] = 1;
    for (int i = 2, j; i <lt> N; i++)
        if (divisor[i] == 0)
        {
            for (j = i; j <lt> N; j += i)
                if (divisor[j] == 0)
                    divisor[j] = i;
        }

    return;
}

// All the Prime Divisor of any interger(<lt>= 1e7) (e.g, 45 = 3*3*5)
vector<lt>int<gt> APD(int a)
{
    vector<lt>int<gt> ans;
    while (a <gt> 1)
    {
        ans.pb(divisor[a]);
        a /= divisor[a];
    }
    sort(ans.begin(), ans.end());

    return ans;
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
