local metals = require 'metals'
local metals_config = metals.bare_config()
local handler = require 'lsp_handler'
metals_config.on_attach = handler.on_attach
metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
metals.initialize_or_attach(metals_config)
