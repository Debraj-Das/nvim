"""
In this scripts only change
1. text => which snippets you want to add
2. language => which language you want
3. tigger => tigger string
4. file_name => files name to tigger
"""

text = """
const int N = 200000 + 5;
ll fact[N], invfact[N];

long long invM(ll a)
{
   int b = mod - 2;
   long long ans = 1;

   while (b)
   {
      if (b & 1)
         ans = (1ll * ans * a) % mod;
      a = (1ll * a * a) % mod;
      b >>= 1;
   }

   return ans;
}

void factorialcul()
{
   fact[0] = 1;
   for (int i = 1; i < N; i++)
   {
      fact[i] = ((fact[i - 1] % mod) * (i % mod)) % mod;
   }

   invfact[N - 1] = invM(fact[N - 1]);
   for (int i = N - 2; i >= 0; --i)
   {
      invfact[i] = ((invfact[i + 1] % mod) * (i + 1)) % mod;
   }

   return;
}

long long ncr(ll n, ll r)
{
   if (r > n)
      return 0ll;

   long long res = fact[n] % mod;
   res = (res * (invfact[n - r] % mod)) % mod;
   res = (res * (invfact[r] % mod)) % mod;

   return res;
}
"""

language = '"cpp"'
tigger = '"ncr"'

file_name = "nCr"


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
