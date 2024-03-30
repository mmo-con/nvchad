require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- mmo mappings

map("n", "ö", "l", { desc = "Move left", noremap = true })
map("n", "l", "k", { desc = "Move down", noremap = true })
map("n", "k", "j", { desc = "Move up", noremap = true })
map("n", "j", "h", { desc = "Move right", noremap = true })
map("n", "<space>ö", "<c-w>l", { desc = "Switch to right buffer", noremap = true })
map("n", "<space>l", "<c-w>k", { desc = "Switch to upper buffer", noremap = true })
map("n", "<space>k", "<c-w>j", { desc = "Switch to lower buffer", noremap = true })
map("n", "<space>j", "<c-w>h", { desc = "Switch to left buffer", noremap = true })
map("n", "H", "^", { desc = "Jump to left margin", noremap = true })
map("n", "L", "$", { desc = "Jump to right margin", noremap = true })

map("v", "ö", "l", { desc = "Move left", noremap = true })
map("v", "l", "k", { desc = "Move down", noremap = true })
map("v", "k", "j", { desc = "Move up", noremap = true })
map("v", "j", "h", { desc = "Move right", noremap = true })
map("v", "H", "g0", { desc = "Jump to left margin", noremap = true })
map("v", "L", "g_", { desc = "Jump to right margin", noremap = true })
map("v", ">", ">gv", { desc = "indent", noremap = true })

-- nvchad

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
