return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				sync_install = false,
				ignore_install = {},
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"rust",
					"typescript",
					"vim",
					"java",
					"javascript",
					"php",
					"html",
					"css",
					"json",
					"http",
					"svelte",
				},
				highlight = {
					enable = true,
					disable = {
						"vimdoc",
					},
				},
				indent = {
					enable = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-backspace>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["is"] = { query = "@scope.inner", query_group = "locals", desc = "Select language scope" },
							["ab"] = { query = "@block.outer" },
							["ib"] = { query = "@block.inner" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "V",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = true,
					},
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
