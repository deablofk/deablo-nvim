-- disable netrw file manager
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.o.background = 'dark'
vim.cmd [[colorscheme gruber-darker]]
vim.cmd('set signcolumn=auto:1')

local signs = {
	DiagnosticSignError = ' ',
	DiagnosticSignWarn = ' ',
	DiagnosticSignHint = ' ',
	DiagnosticSignInfo = ' '
}

for hl, icon in pairs(signs) do
	vim.fn.sign_define(hl, { text = '', numhl = hl })
end
vim.o.guicursor = 'a:blinkon100'
