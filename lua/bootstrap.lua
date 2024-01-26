M = {}

local fn = vim.fn
local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

M.is_packer_installed = function()
	if fn.empty(fn.glob(packer_path)) > 0 then
		return false
	end
	return true
end

M.install_packer = function()
	fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path })
end

M.uninstall_packer = function()
	fn.system({ 'rm', '-rf', packer_path })
end

M.bootstrap_packer = function()
	if not M.is_packer_installed() then
		M.install_packer()
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

return M
