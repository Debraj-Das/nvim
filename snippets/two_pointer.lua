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
		"twopointer",
		fmta(
			[[
/*
Conditions to use Two pointer or sliding windows
   1. Subarray or continuous subsequence =<gt> continuoues windows
   2. if l <lt> l* then r <le> r*
*/

// Example for two pointer: longest subarray with given sum for non nagative element of array
int twoPointer(int ar[], int n, int sum) {
   // intial empty windows left and right side
   int l = 0, r = 0;
   // window value for empty windows
   int winVal = 0;
   // answer for intial empty window
   int ans = 0;

   while (l <lt> n) {
      // Sliding right pointer to forward depending on condition
      while (r <lt> n and (winVal + ar[r] <le> sum)) {
         // update the window value for include the rth element(ar[r]);
         winVal += ar[r];
         // forward the right
         r++;
      }

      // update the answer for this window if condition satisfy.
      if(winVal <le> sum and ans <lt> (r-l))
		  ans = r - l ;

      // moving left to one step forward
      // non empty window
      if (r <gt> l) {
         // update window value for exclude the lth element(ar[l]);
         winVal -= ar[l];
         // forward the left
         l++;
      }
      // empty window
      else {
         // moving forward completed empty window
         l++;
         r++;
      }
   }

   return ans;
}

<finished>

/*
Some Imp key points of this implement
   1. window range [l,r) and for l == r window is empty
   2. find the window value(winVal) for checking windows conditions and storeing the windows value
   3. find to include and exclude the element form the windows and accordingly update the windows value
*/
		]],
			{
				finished = i(0),
				lt = t("<"),
				le = t("<="),
				gt = t(">"),
			}
		)
	),
})
