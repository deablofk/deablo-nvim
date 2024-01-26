local metals = require 'metals'
local metals_config = metals.bare_config()

metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
metals.initialize_or_attach(metals_config)
