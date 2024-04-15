vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NVIMTREE
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { desc = 'Focus on Nvim Tree' })
vim.keymap.set('n', '<leader>N', ':NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })

-- some emacs keymaps because its useful (insert  and command mode only)
vim.keymap.set({ 'i', 'c' }, '<A-b>', '<S-Left>')
vim.keymap.set({ 'i', 'c' }, '<A-f>', '<S-Right>')

vim.keymap.set({ 'i', 'c' }, '<C-b>', '<Left>')
vim.keymap.set({ 'i', 'c' }, '<C-f>', '<Right>')

vim.keymap.set({ 'i', 'c' }, '<C-e>', '<End>')
vim.keymap.set({ 'i', 'c' }, '<C-a>', '<Home>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- TELESCOPE
vim.keymap.set('n', '<leader>?', require 'telescope.builtin'.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require 'telescope.builtin'.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require 'telescope.themes'.get_dropdown {
		winblend = 0,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require 'telescope.builtin'.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require 'telescope.builtin'.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require 'telescope.builtin'.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require 'telescope.builtin'.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require 'telescope.builtin'.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- LAZYGIT
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { silent = true, desc = '[L]azy [G]it' })

-- DATABASE MANAGEMENT USING DADBOD AND DADBOD-UI
vim.keymap.set('n', '<leader>db', ':DBUI<CR>', { silent = true, desc = '[D]ad[B]od' })
