local formatters = {
	'google-java-format',
	'prettier',
	'black',
	'sonarlint-language-server',
	-- debuggers
	'java-debug-adapter',
	'java-test',
}

local servers = {
	'clangd',
	'gopls',
	'pyright',
	'rust_analyzer',
	'html',
	'cssls',
	'jsonls',
	'jdtls',
	'intelephense',
	'lua_ls',
	'svelte',
	'tsserver',
}

require 'neodev'.setup()
require 'mason'.setup()

local capabilities = require 'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local handler = require 'lsp_handler'
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
	ensure_installed = servers
}

require 'mason-null-ls'.setup {
	ensure_installed = formatters
}

mason_lspconfig.setup_handlers {
	function(server_name)
		if server_name ~= 'jdtls' then
			require 'lspconfig'[server_name].setup {
				capabilities = capabilities,
				on_attach = handler.on_attach,
				settings = servers[server_name],
			}
		end
	end,
}
