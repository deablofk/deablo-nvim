local handler = {}
handler.on_attach = function(_, bufnr)
	local lspbuf = vim.lsp.buf
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', lspbuf.rename, '[R]e[n]ame')
	nmap('<leader>ca', lspbuf.code_action, '[C]ode [A]ction')
	nmap('<leader>D', lspbuf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require 'telescope.builtin'.lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require 'telescope.builtin'.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('<leader>wa', lspbuf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', lspbuf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>ij', function() vim.diagnostic.open_float({ scope = 'line' }) end, 'Open Line Diagnostic in Float')
	nmap('<leader>wl', function() print(vim.inspect(lspbuf.list_workspace_folders())) end, '[W]orkspace [L]ist Folders')
	nmap('<leader>f', function() lspbuf.format { async = true } end, '[F]ormat the current document')
	nmap('<C-k>', lspbuf.signature_help, 'Signature Documentation')
	nmap('gd', lspbuf.definition, '[G]oto [D]efinition')
	nmap('gr', require 'telescope.builtin'.lsp_references, '[G]oto [R]eferences')
	nmap('gI', lspbuf.implementation, '[G]oto [I]mplementation')
	nmap('K', lspbuf.hover, 'Hover Documentation')
	nmap('gD', lspbuf.declaration, '[G]oto [D]eclaration')
	vim.keymap.set('n', '<leader>sd', ':Telescope diagnostics<CR>',
		{ buffer = vim.api.nvim_get_current_buf(), desc = 'TELESCOPE LSP: [S]earch [D]iagostics' })
end

handler.jdtls_dap_keybinds = function(_, bufnr)
	vim.keymap.set('n', '<leader>df', function() require 'jdtls'.test_class() end,
		{ buffer = bufnr, desc = "Test Class" })
	vim.keymap.set('n', '<leader>dn', function() require 'jdtls'.test_nearest_method() end,
		{ buffer = bufnr, desc = "Test Nearest Method" })
	vim.keymap.set('n', "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Set breakpoint" })
	vim.keymap.set('n', "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
		{ desc = "Set conditional breakpoint" })
	vim.keymap.set('n', "<leader>bl",
		"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
		{ desc = "Set log point" })
	vim.keymap.set('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
	vim.keymap.set('n', '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', { desc = "List breakpoints" })
	vim.keymap.set('n', "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
	vim.keymap.set('n', "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
	vim.keymap.set('n', "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
	vim.keymap.set('n', "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
	vim.keymap.set('n', '<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", { desc = "Disconnect" })
	vim.keymap.set('n', '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate" })
	vim.keymap.set('n', "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Open REPL" })
	vim.keymap.set('n', "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
	vim.keymap.set('n', '<leader>di', function() require "dap.ui.widgets".hover() end, { desc = "Variables" })
	vim.keymap.set('n', '<leader>d?',
		function()
			local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
		end, { desc = "Scopes" })
	vim.keymap.set('n', '<leader>tf', '<cmd>Telescope dap frames<cr>', { desc = "List frames" })
	vim.keymap.set('n', '<leader>th', '<cmd>Telescope dap commands<cr>', { desc = "List commands" })
end

return handler
