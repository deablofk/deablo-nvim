-- INDENT BLANK LINE
require 'ibl'.setup {
	scope = {
		enabled = true,
		show_start = false,
	}
}
-- HEXADECIMAL COLORS
require 'nvim-highlight-colors'.setup {}

-- GITSIGNS ICONS
require 'gitsigns'.setup {
	signs = {
		add          = { text = '▎' },
		change       = { text = '▎' },
		delete       = { text = '󰐊' },
		topdelete    = { text = '󰐊' },
		changedelete = { text = '▎' },
		untracked    = { text = '┆' },
	},
	sign_priority = 0,
}

-- SMOOTH SCROOL
require 'neoscroll'.setup()

-- LUA BAR LINE
require 'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = {
			left = '▎',
			right = '',
		},
		section_separators = '',
		ignore_focus = { 'NvimTree', 'neo-tree' },
		disabled_filetypes = { 'packer', 'NvimTree', 'neo-tree' }
	},
	sections = {

		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'filetype', 'branch' },
		lualine_y = {},
		lualine_z = {}
	},
}

-- AUTO FOLDING IMPORTS
function java_import_folding()
	return vim.fn.match(vim.fn.getline(vim.v.lnum), '^import') ~= -1 and 1 or 0
end

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.java_import_folding()'
vim.cmd('hi Folded guibg=#181818')
vim.o.fillchars = 'fold: '

-- WHICH KEY
require 'which-key'.load()

-- TREE SITTER
require 'nvim-treesitter.configs'.setup {
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	ensure_installed = {
		'c',
		'cpp',
		'go',
		'lua',
		'python',
		'rust',
		'typescript',
		'vim',
		'java',
		'javascript',
		'php',
		'html',
		'css',
		'json',
		'http',
		'svelte'
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-backspace>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
				['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
				['is'] = { query = '@scope.inner', query_group = 'locals', desc = 'Select language scope' },
				['ab'] = { query = '@block.outer' },
				['ib'] = { query = '@block.inner' },
			},
			selection_modes = {
				['@parameter.outer'] = 'v',
				['@function.outer'] = 'V',
				['@class.outer'] = '<c-v>',
			},
			include_surrounding_whitespace = true,
		},
	},
}

local highlights = {
	IlluminatedWord = { bg = '#96A6C8', fg = '#E4E4E4' },
	IlluminatedCurWord = { bg = '#96A6C8', fg = '#E4E4E4' },
	IlluminatedWordText = { bg = '#96A6C8', fg = '#E4E4E4' },
	IlluminatedWordRead = { bg = '#96A6C8', fg = '#E4E4E4' },
	IlluminatedWordWrite = { bg = '#96A6C8', fg = '#E4E4E4' },
}

for group, value in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, value)
end
