-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- TODO: remove from here later
vim.opt.termguicolors = true

-- set the colorscheme
vim.o.background = 'dark'
vim.cmd.colorscheme 'github_dark_default'

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "auto:1"

local signs = {
	DiagnosticSignError = ' ',
	DiagnosticSignWarn = ' ',
	DiagnosticSignHint = ' ',
	DiagnosticSignInfo = ' '
}

for hl, _ in pairs(signs) do
	vim.fn.sign_define(hl, { text = '', numhl = hl })
end
vim.o.guicursor = 'a:blinkon100'

-- FILE AUTO RELOADS --
vim.o.autoread = true

vim.api.nvim_create_autocmd(
	{ "WinEnter", "BufWinEnter", "BufEnter", "BufLeave", "TabEnter" },
	{
		pattern = "*",
		callback = function()
			vim.cmd("checktime")
		end,
	}
)
