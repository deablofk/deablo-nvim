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
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarxml.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarlintomnisharp.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonartext.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjavasymbolicexecution.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarphp.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcsharp.jar"),
						-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
					},
				},
				filetypes = { "java", "html", "js", "xml", "dockerfile",
					-- "go",
					-- "cs",
					-- "c",
					-- "cpp",
					-- "php",
					-- "xml",
					-- "py",
					-- "json",
					-- "bicep",
					-- "yaml",
					-- "yml",
					-- "tf",
					-- "tfvars",
					-- "properties"
				}
			})
		end,
	},
}
