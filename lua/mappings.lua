require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

map('n', 'ö', 'l', { desc = 'Move cursor right' })
map('n', 'l', 'k', { desc = 'Move cursor up' })
map('n', 'k', 'j', { desc = 'Move cursor down' })
map('n', 'j', 'h', { desc = 'Move cursor left' })

map('v', 'ö', 'l', { desc = 'Move cursor right' })
map('v', 'l', 'k', { desc = 'Move cursor up' })
map('v', 'k', 'j', { desc = 'Move cursor down' })
map('v', 'j', 'h', { desc = 'Move cursor left' })

map('n', '<Space>ö', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<Space>l', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<Space>k', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<Space>j', '<C-w><C-h>', { desc = 'Move focus to the left window' })

map('n', '<C-Left>', ':vs<CR>', { desc = 'Move focus to the left window' })
map('n', '<C-Right>', ':vs<CR>', { desc = 'Move focus to the left window' })
map('n', '<C-Down>', ':sp<CR>', { desc = 'Move focus to the left window' })
map('n', '<C-Up>', ':sp<CR>', { desc = 'Move focus to the left window' })

map('i', 'jk', '<Esc>', { desc = 'Quickly escape from insert mode' })
map('n', 'H', '^', { desc = 'Move to the very left border' })
map('n', 'L', '$', { desc = 'Move to the very right border' })
map('v', 'L', 'g_', { desc = 'Move to the very right border' })
map('n', 'U', 'i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w', { desc = 'Split lines' })

map('n', '<Leader>tb', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle inline git blame' })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
