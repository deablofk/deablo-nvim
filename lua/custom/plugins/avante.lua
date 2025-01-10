return { {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = true, -- set this to "*" if you want to always pull the latest change, false to update on release
	opts = {
		-- add any opts here
		provider = "openai",
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "gpt-4o-mini",
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			-- Make sure to set this up properly if you have lazy=true
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "markdown", "md", "Avante" },
			},
			ft = { "markdown", "md", "Avante" },
		},
	},
} }
