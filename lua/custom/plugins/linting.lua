return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				java = {},
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"https://gitlab.com/schrieveslaach/sonarlint.nvim",
		config = function()
			require("sonarlint").setup({
				server = {
					cmd = {
						vim.fn.expand("$MASON/bin/sonarlint-language-server"),
						"-stdio",
						"-analyzers",
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcsharp.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarlintomnisharp.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/csharpenterprise.jar"),
					},
				},
				filetypes = { "java", "cs" },
			})
		end,
	},
}
