M = {}
M.plugins = {
	-- packer
	{ 'wbthomason/packer.nvim' },

	-- LSP STUFF
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'folke/neodev.nvim' },
	{ 'mfussenegger/nvim-jdtls' },
	{ 'scalameta/nvim-metals' },
	{ 'ray-x/lsp_signature.nvim' },
	{ 'https://gitlab.com/schrieveslaach/sonarlint.nvim' },
	{ 'mfussenegger/nvim-dap' },
	{ 'rcarriga/nvim-dap-ui' },

	-- FORMATTING, DIAGNOSTIC, ETC
	{ 'jose-elias-alvarez/null-ls.nvim' },
	{ 'jay-babu/mason-null-ls.nvim' },
	{ 'numToStr/Comment.nvim' },

	-- AUTO COMPLETION
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/cmp-path' },

	-- SNIPPETS
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ 'windwp/nvim-autopairs' },

	--FUZZY FINDER
	{ 'nvim-telescope/telescope.nvim' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-telescope/telescope-fzf-native.nvim' },

	-- SYNTAX HIGHLIGHT  | VISUAL STUFF
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'norcalli/nvim-colorizer.lua' },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'brenoprata10/nvim-highlight-colors' },
	{ 'karb94/neoscroll.nvim' },
	{ 'folke/which-key.nvim' },
	{ 'RRethy/vim-illuminate' },
	{ 'deablofk/dagruber' },
	{ 'rktjmp/lush.nvim' },

	-- DATABASE MANAGEMENT
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },

	-- GIT
	{ 'lewis6991/gitsigns.nvim' },
	{ "kdheepak/lazygit.nvim" },

	-- FOLDER TREE
	{ 'nvim-tree/nvim-tree.lua' },
	{ 'nvim-tree/nvim-web-devicons' },

	-- ORGANIZATION
	{ 'vimwiki/vimwiki' },

	-- INDENTATION
	{ 'Darazaki/indent-o-matic' },
	{ 'nvim-treesitter/nvim-treesitter-textobjects',     after = 'nvim-treesitter' },

	-- DISCORD
	{ 'andweeb/presence.nvim' },
}

return M
