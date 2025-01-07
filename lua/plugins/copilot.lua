return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set('i','<A-j>', '<Plug>(copilot-next)')
		vim.keymap.set('i','<A-k>', '<Plug>(copilot-previous)')
		vim.keymap.set('i','<A-h>', '<Plug>(copilot-accept-word)')
		vim.keymap.set('i','<A-l>', '<Plug>(copilot-accept-line)')
		vim.keymap.set('i','<A-;>', '<Plug>(copilot-dismiss)')
	end
}
