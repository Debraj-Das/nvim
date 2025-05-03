"""
In this scripts only change
1. text => which snippets you want to add
2. language => which language you want
3. tigger => tigger string
4. file_name => files name to tigger
"""

text = """
const int N = 1e7 + 1;
int divisor[N] = {0};

void primeDivisor()
{
    divisor[1] = 1;
    for (int i = 2, j; i < N; i++)
        if (divisor[i] == 0)
        {
            for (j = i; j < N; j += i)
                if (divisor[j] == 0)
                    divisor[j] = i;
        }

    return;
}

// All the Prime Divisor of any interger(<= 1e7) (e.g, 45 = 3*3*5)
vector<int> APD(int a)
{
    vector<int> ans;
    while (a > 1)
    {
        ans.pb(divisor[a]);
        a /= divisor[a];
    }
    sort(ans.begin(), ans.end());

    return ans;
}
"""

language = '"cpp"'
tigger = '"divisor"'

file_name = "divisor"


import os

if os.path.exists(f"{file_name}.lua"):
    print(f"{file_name}.lua present previously")
    persue = input("Want to change the {file_name}.lua ('y'/ any key):")
    if persue != "y":
        exit(1)


START = """
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

"""

BODY = (
    """ls.add_snippets("""
    + language
    + """, {
	s(
		"""
    + tigger
    + """,
		fmta([=["""
)

st = [START, BODY]

PRESENT_LT = False
PRESENT_GT = True
for ch in text:
    if ch == "<":
        st.append("<lt>")
        PRESENT_LT = True
    elif ch == ">":
        st.append("<gt>")
        PRESENT_GT = True
    else:
        st.append(ch)


END1 = """<finish>
		]=],
		{
"""

LTS = """\t\t\tlt = t('<'),"""
GTS = """\t\t\tgt = t('>'),"""

END2 = """
			finish = i(0),
		})
	),
})
"""

st.append(END1)

if PRESENT_LT:
    st.append(LTS)
    st.append("\n")

if PRESENT_GT:
    st.append(GTS)

st.append(END2)


snippts = "".join(st)

with open(f"{file_name}.lua", "w") as f:
    f.write(snippts)
