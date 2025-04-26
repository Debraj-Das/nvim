local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("sh", {
	s("st", {
		t({
			"#!/usr/bin/env bash",
			"",
			"",
			"# Set -euo pipefail:  Exit immediately if a command exits with a non-zero status.",
			"# -e: Exit if a command exits with a non-zero status.",
			"# -u: Treat unset variables as an error.",
			"# -o pipefail:  If a command in a pipeline fails, the whole pipeline fails.",
			"set -euo pipefail",
			"",
			"",
		}),
		i(0), -- starting point INSIDE solve()
		t({
			"",
			"",
			"",
			"",
			"exit 0",
		}),
	}),
})
