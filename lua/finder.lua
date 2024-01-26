require 'telescope'.setup({
	defaults = {
		file_ignore_patterns = {
			'.class',
			'gradle/',
		},
	},
	pickers = {
		buffers = {
			sort_lastused = true
		}
	},
})
pcall(require 'telescope'.load_extension, 'fzf')
