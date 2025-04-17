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
local r = ls.restore_node

ls.add_snippets("lua", {
	s("class", {
		-- Choice: Switch between two different Nodes, first parameter is its position, second a list of nodes.
		c(1, {
			t("public "),
			t("private "),
		}),
		t("class "),
		i(2),
		t(" "),
		c(3, {
			t("{"),
			-- sn: Nested Snippet. Instead of a trigger, it has a position, just like insertNodes. !!! These don't expect a 0-node!!!!
			-- Inside Choices, Nodes don't need a position as the choice node is the one being jumped to.
			sn(nil, {
				t("extends "),
				-- restoreNode: stores and restores nodes.
				-- pass position, store-key and nodes.
				r(1, "other_class", i(1)),
				t(" {"),
			}),
			sn(nil, {
				t("implements "),
				-- no need to define the nodes for a given key a second time.
				r(1, "other_class"),
				t(" {"),
			}),
		}),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
})
