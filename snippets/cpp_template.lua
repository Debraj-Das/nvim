local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
	s("cp", {
		t({
			"/*",
			'   "You cannot believe in God until you believe in yourself."',
			"                                          by Swami Vivekananda",
			"*/",
			'#pragma GCC optimize("Ofast")',
			'#pragma GCC optimize("unroll-loops")',
			"",
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"using ll = long long;",
			"using ld = long double;",
			"const char el = '\\n';",
			"const char sp = ' ';",
			"",
			"inline void solve();",
			"",
			"int32_t main() {",
			"    ios_base::sync_with_stdio(0);",
			"    cin.tie(0), cout.tie(0);",
			"",
			"    int TC = 1;",
			"    /* cin >> TC; */",
			"    for (int i = 0; i < TC; i++) {",
			'        /* cout<<"case "<<(i+1)<<": "; */',
			"        solve();",
			"        cout << '\\n';",
			"    }",
			"",
			"    return 0;",
			"}",
			"",
			"void solve() {",
		}),
		i(0), -- starting point INSIDE solve()
		t({
			"",
			"",
			"    return;",
			"}",
		}),
	}),
})
