return {
	{ "projekt0n/github-nvim-theme", lazy = false },
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require 'colorizer'.setup()
		end
	},
}
