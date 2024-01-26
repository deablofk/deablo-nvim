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

return handler
