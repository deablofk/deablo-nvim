return {
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
	},
	{
		"stevearc/overseer.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		config = function()
			require("overseer").setup({
				strategy = {
					"toggleterm",
					use_shell = false,
					direction = "float",
					highlights = nil,
					auto_scroll = false,
					close_on_exit = false,
					quit_on_exit = "never",
					open_on_start = true,
					hidden = false,
					on_create = nil,
				},
				templates = { "builtin", "spring.run", "spring.run-test" },
				task_list = {
					direction = "bottom",
					max_width = 30,
					min_width = 30,
					min_height = 5,
				},
			})
		end,
	},
}
