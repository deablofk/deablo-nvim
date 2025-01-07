return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					java = { "google-java-format" },
					lua = { "stylua" },
					python = { "black" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					kts = { "ktfmt" },
					gradle = { "npm-groovy-lint" },
					cs = { "csharpier" },
					yaml = { "yamlfmt" },
					yml = { "yamlfmt" },
				},
			})
		end,
	},
}
