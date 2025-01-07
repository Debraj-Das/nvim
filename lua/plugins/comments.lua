return {
	"terrortylor/nvim-comment",
	config = function()
		local conf = require("nvim_comment")
		conf.setup({
			comment_empty = false,
		})
	end
}
