local rest_nvim = require 'rest-nvim'

rest_nvim.setup({
	result_split_horizontal = false,
	result_split_in_place = false,
	skip_ssl_verification = false,
	encode_url = true,
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		show_url = true,
		show_http_info = true,
		show_headers = true,
		formatters = {
			json = 'jq'
		},
	},
	jump_to_request = false,
	env_file = '.env',
	custom_dynamic_variables = {},
	yank_dry_run = true,
})


vim.api.nvim_create_autocmd('FileType', {
	pattern = 'http',
	callback = function()
		local buff = tonumber(vim.fn.expand('<abuf>'), 10)
		vim.keymap.set('n', '<leader>r', rest_nvim.run, { noremap = true, buffer = buff })
		vim.keymap.set('n', '<leader>l', rest_nvim.run, { noremap = true, buffer = buff })
		vim.keymap.set('n', '<leader>v', function() rest_nvim.run(true) end, { noremap = true, buffer = buff })
	end
})
