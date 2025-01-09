local servers = {
	"html",
	"cssls",
	"jsonls",
	"jdtls",
	"gradle_ls",
	"kotlin_language_server",
	"lua_ls",
	"ast_grep",
	"clangd",
	"pyright",
}

local tools = {
	"sonarlint-language-server",
	"prettier",
	"google-java-format"
}

local handler = require("keymaps-lsp")

return {
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup({
				jdk = {
					auto_install = false,
					-- version = "21.0.2",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require('mason-tool-installer').setup({
				ensure_installed = tools
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
			"nvim-java/nvim-java",
		},
		config = function()
			require("mason").setup()

			local lspcfg = require("mason-lspconfig")
			lspcfg.setup({
				ensure_installed = servers,
				automatic_installation = true,
			})
			lspcfg.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("blink.cmp").get_lsp_capabilities(),
						on_attach = handler.on_attach,
						settings = servers[server_name],
					})
				end,
			})
		end,
	},
}
