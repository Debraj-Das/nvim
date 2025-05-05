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
		"gen",
		fmta(
			[=[
#pragma GCC optimize("Ofast")
#pragma GCC optimize("unroll-loops")
#pragma GCC target("sse,sse2,sse3,ssse3,sse4,popcnt,abm,mmx,avx,tune=native")

#include <lt>bits/stdc++.h<gt>
using namespace std;

using ll = long long;
using ld = long double;
const char el = '\n';
const char sp = ' ';
const int mod = 1e9 + 7;
const int inf = INT_MAX;
const ll INF = 1ll * mod * mod;
const ld ep = 0.0000001;
const ld pi = acos(-1.0);
#define setpr(x) cout <lt><lt> setprecision(x) <lt><lt> fixed

// clang-format off
std::mt19937 random_number_generator(std::chrono::steady_clock::now().time_since_epoch().count());
inline int rng(int l = 0, int r = 1e9){ return std::uniform_int_distribution<lt>int<gt>(l, r)(random_number_generator); }
// clang-format on

inline double rdd(int l = 0, int r = 100000) {
    double ans = rng(1000, 1000 * r);
    return ans / 1000;
}

// shuffle(v.begin(), v.end(), rng);  // shuffle syntex

const string a = "abcdefghijklmnopqrstuvwxyz";
const string A = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const string num = "0123456789";
const string spec = "!@#$%^&*";

inline char rdc() {
    const string source = a;
    const int n = source.size() - 1;

    return source[rng(0, n)];
}

void text(int len) {
    const string source = a + A + num + spec;
    const int n = source.size() - 1;

    while (len--) {
        cout <lt><lt> source[rng(0, n)];
    }
    cout <lt><lt> el;
    return;
}

void arr(const int n, const int l = 0, const int r = 1e9) {
    for (int i = 0; i <lt> n; i++) {
        cout <lt><lt> rng(l, r) <lt><lt> sp;
    }
    cout <lt><lt> el;
    return;
}

void distinctElements(const int n, const int l = 0, const int r = 1e9) {
    set<lt>int<gt> used;
    for (int i = 0, x; i <lt> n; i++) {
        do {
            x = rng(l, r);
        } while (used.count(x));

        cout <lt><lt> x <lt><lt> sp;
        used.insert(x);
    }
    cout <lt><lt> el;
    return;
}

void tree(int n) {
    vector<lt>pair<lt>int, int<gt><gt> edges;
    for (int i = 2; i <lt>= n; ++i) {
        edges.emplace_back(rng(1, i - 1), i);
    }

    shuffle(edges.begin(), edges.end(), random_number_generator);
    for (pair<lt>int, int<gt> &e : edges) {
        if (rng() % 2) {
            swap(e.first, e.second);
        }
        cout <lt><lt> e.first <lt><lt> sp <lt><lt> e.second <lt><lt> el;
    }
    return;
}

void graph(const int n, const int m) {
    set<lt>pair<lt>int, int<gt><gt> st;
    int u, v;
    for (int i = 0; i <lt> m; i++) {
        do {
            u = rng(1, n - 1);
            v = rng(u + 1, n);
        } while (st.count(make_pair(u, v)));

        st.insert(make_pair(u, v));

        if ((u + v) & 1) {
            swap(u, v);
        }
        cout <lt><lt> u <lt><lt> sp <lt><lt> v <lt><lt> el;
    }

    st.clear();
    return;
}

void solve();

int32_t main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0), cout.tie(0);

    int TC = 1;
    /*<first> cout <lt><lt> TC <lt><lt> el; */
    while (TC--) {
        solve();
        cout <lt><lt> el;
    }

    return 0;
}

void solve() {
	<finish>

    return;
}
		]=],
			{
				lt = t("<"),
				gt = t(">"),
				first = i(1),
				finish = i(0),
			}
		)
	),
})
