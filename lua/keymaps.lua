vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- NVIM TREE
vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>", { desc = "Focus on Nvim Tree", silent = true })

-- SOME EMACS KEYMAPS BECAUSE ITS USEFUL (INSERT  AND COMMAND MODE ONLY)
vim.keymap.set({ "i", "c" }, "<A-b>", "<S-Left>")
vim.keymap.set({ "i", "c" }, "<A-f>", "<S-Right>")
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>")
vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>")

-- DIAGNOSTIC KEYMAPS
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- TELESCOPE (FINDER)
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 0,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "Search Word" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "Search Grep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "Search Diagnostics" })

-- LAZYGIT
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { silent = true, desc = "[L]azy [G]it" })

-- DATABASE MANAGEMENT USING DADBOD AND DADBOD-UI
vim.keymap.set("n", "<leader>db", ":DBUI<CR>", { silent = true, desc = "[D]ad[B]od" })

-- OVERSEER
vim.keymap.set("n", "<leader>rt", ":OverseerToggle<CR>", { silent = true, desc = "Runner Toggler Output" })
vim.keymap.set("n", "<leader>rr", ":OverseerQuickAction restart<CR>", { silent = true, desc = "Runner Restart" })
vim.keymap.set("n", "<leader>rs", ":OverseerQuickAction stop<CR>", { silent = true, desc = "Runner Stop" })
vim.keymap.set("n", "<leader>rc", ":OverseerRun<CR>", { silent = true, desc = "Runner Command Set" })

-- FORMATTING LSP
vim.keymap.set("n", "<leader>f", function()
	require("conform").format()
end, { silent = true, desc = "Format current buffer" })

-- FOR QUITING THE INSERT MODE IN TERMINAL WITH ESC
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
