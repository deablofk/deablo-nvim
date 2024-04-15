require 'nvim-tree'.setup {
	update_focused_file = {
		enable = true,
	},
	renderer = {
		indent_width = 2,
		icons = {
			show = {
				file = false,
				folder = true
			},
			web_devicons = {
				file = {
					enable = true,
					color = false,
				},
				folder = {
					enable = false,
					color = false,
				},
			},
		}
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			eject = true,
			resize_window = true,
		},
	},
}

local highlights = {
	NvimTreeFolderName = { fg = '#ffdd33' },
	NvimTreeOpenedFolderName = { fg = '#ffdd33' },
	NvimTreeEmptyFolderName = { fg = '#ffdd33' },
	NvimTreeFolderIcon = { fg = '#cc8c3c' },
}

for group, value in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, value)
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	callback = function()
		-- Verify if Neovim has not been executed with parameters and open NvimTree automatically on empty Neovim focus.
		if vim.fn.argc() == 0 then
			require 'nvim-tree.api'.tree.toggle({
				focus = true,
			})
			vim.opt_local.fillchars = "eob: "
		end
	end
})
