vim.g.db_ui_win_position = "right"
vim.g.db_ui_show_help = 0
vim.g.db_ui_use_nerd_fonts = 1


vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "dbui", "NvimTree_1" },
	callback = function()
		vim.opt_local.fillchars = "eob: "
	end
})
