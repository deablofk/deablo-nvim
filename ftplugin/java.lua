local fn = vim.fn

-- constants
local data_path = fn.stdpath('data')
local jdtls_dir = data_path .. '/mason/packages/jdtls/'
local workspace_dir = data_path .. '/jdtlscache/' .. fn.fnamemodify(fn.getcwd(), ':p:h:t')
local launcher_jar = string.gsub(fn.system('ls ' .. jdtls_dir .. 'plugins/org.eclipse.equinox.launcher_*.jar'), '\n',
	'')

if not launcher_jar or launcher_jar == '' then
	print('Error: Launcher JAR not found.')
	fn.system('echo "Error: Launcher JAR not found." && exit 1')
end

-- LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'detail',
		'documentation',
		'additionalTextEdits',
	},
}

-- LSP handler
local handler = require('lsp_handler')

-- LSP configuration (jdtls)
local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens',
		'java.base/java.util=ALL-UNNAMED',
		'--add-opens',
		'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. jdtls_dir .. 'lombok.jar',
		'-jar', launcher_jar,
		'-configuration', jdtls_dir .. 'config_linux',
		'-data', workspace_dir
	},
	root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
	settings = {
		java = {
			trace = { server = 'message' },
			referenceCodeLens = { enabled = true },
			format = { enabled = false },
			saveActions = { organizeImports = false },
			completion = { importOrder = { 'java', 'javax', 'com', 'org' } },
			codeGeneration = {
				tostring = {
					listArrayContents = true,
					skipNullValues = true,
					template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
				},
				useBlocks = true,
				hashCodeEquals = {
					useInstanceof = true,
					useJava7Objects = true
				},
				generateComments = false,
				insertLocation = true
			},
			autobuild = {
				enabled = true
			},
			progressReports = {
				enabled = false
			},
			eclipse = {
				downloadSources = true
			},
			maven = {
				downloadSources = true,
				updateSnapshots = true
			},
		}
	},
	capabilities = capabilities,
	on_attach = handler.on_attach,
	init_options = { bundles = {} },
}

require('jdtls').start_or_attach(config)

-- Sonarlint setup
require('sonarlint').setup({
	server = {
		cmd = {
			fn.expand('$MASON/bin/sonarlint-language-server'),
			'-stdio',
			'-analyzers',
			fn.expand('$MASON/share/sonarlint-analyzers/sonarjava.jar'),
		}
	},
	filetypes = { 'java' }
})
