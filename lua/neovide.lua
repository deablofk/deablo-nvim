local fontFamily = "Red Hat Mono"
local heightSize = "12"
local widthSize = "-1"

if vim.g.neovide then
    local function isFontPresent(fontFamily)
        local command = "fc-list : family | grep -q \"" .. fontFamily .. "\""
        local exit_code = os.execute(command)
        return exit_code == 0
    end

    if isFontPresent(fontFamily) then
        vim.o.guifont = "" .. fontFamily .. ":h" .. heightSize .. ":w" .. widthSize
    end

    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_unlink_border_highlights = false
    vim.g.neovide_scroll_animation_length = 0.3
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.keymap.set('n', '<C-s>', ':w<CR>')   -- Save
    vim.keymap.set('v', '<C-c>', '"+y')      -- Copy
    vim.keymap.set('n', '<C-v>', '"+P')      -- Paste normal mode
    vim.keymap.set('v', '<C-v>', '"+P')      -- Paste visual mode
    vim.keymap.set('c', '<C-v>', '<C-R>+')   -- Paste command mode
    vim.keymap.set('i', '<C-v>', '<C-R>+')   -- Paste insert mode
end
