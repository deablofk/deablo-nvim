local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.config.set_config({
	region_check_events = 'InsertEnter',
	delete_check_events = 'TextChanged,InsertLeave'
})

require 'luasnip/loaders/from_vscode'.lazy_load()

local cmp_icons = {
	Text = '󰦨',
	Method = '',
	Function = '󰊕',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = '󰕳',
	Property = '',
	Unit = '󰚯',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = 'פּ',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
			{ name = 'path' }
		},
		{
			{
				name = 'cmdline',
				option = {
					ignore_cmds = { 'Man', '!' }
				}
			}
		})
})

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert {
		['<C-f'] = cmp.mapping.scroll_docs(-4),
		['<C-d'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			select = true
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'luasnip' },
	},
	formatting = {
		format = function(entry, item)
			item.kind = string.format('%s %s', cmp_icons[item.kind], item.kind)
			return item
		end
	},
	experimental = {
		ghost_text = false,
	},
	window = {
		completion = {
			border = 'rounded'
		}
	}
}
