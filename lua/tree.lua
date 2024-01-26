require 'nvim-tree'.setup {
	update_focused_file = {
		enable = true,
	},
}

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	callback = function()
		-- Verify if Neovim has not been executed with parameters and open NvimTree automatically on empty Neovim focus.
		if vim.fn.argc() == 0 then
			require 'nvim-tree.api'.tree.toggle({
				focus = true,
			})
		end
	end
})
