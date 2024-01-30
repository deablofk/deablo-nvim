require 'ultimate-autopair'.setup()

local null_ls = require 'null-ls'

null_ls.setup {
	debug = false,
	sources = {
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.scalafmt,
	},
}

require 'indent-o-matic'.setup {
	max_lines = -1,
	standard_widths = { 2, 4, 8 },
	skip_multiline = true,
}

require 'Comment'.setup()
