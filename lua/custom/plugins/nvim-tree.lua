return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
				},
				hijack_directories = {
					enable = false,
				},
				renderer = {
					group_empty = true,
					indent_width = 2,
					-- TODO: may be is good to apply some regex for icons
					icons = {
						show = {
							file = false,
							folder = true,
						},
						web_devicons = {
							file = {
								enable = true,
								color = true,
							},
							folder = {
								enable = false,
								color = false,
							},
						},
						glyphs = {
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "",
							},
						},
					},
				},
				filters = {
					enable = true,
					git_ignored = false,
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
					no_bookmark = false,
					custom = {},
					exclude = {},
				},
				diagnostics = {
					enable = true,
					show_on_dirs = false,
					show_on_open_dirs = true,
					debounce_delay = 500,
					severity = {
						min = vim.diagnostic.severity.HINT,
						max = vim.diagnostic.severity.ERROR,
					},
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
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
			})

			-- automaticaly open nvim tree on folder
			vim.api.nvim_create_autocmd({ "VimEnter" }, {
				callback = function()
					-- Verify if Neovim has not been executed with parameters and open NvimTree automatically on empty Neovim focus.
					if vim.fn.argc() == 0 then
						require("nvim-tree.api").tree.toggle({
							focus = true,
						})
						vim.opt_local.fillchars = "eob: "
					end
				end,
			})
		end,
	},
}
