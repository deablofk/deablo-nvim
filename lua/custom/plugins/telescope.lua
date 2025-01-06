return {
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						".class",
						"gradle/",
					},
				},
				pickers = {
					buffers = {
						sort_lastused = true,
					},
				},
			})
			pcall(require("telescope").load_extension, "fzf")
		end,
	},
}
