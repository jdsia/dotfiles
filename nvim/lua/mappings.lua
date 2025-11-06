require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, { desc = 'Telescope Find Document Symbols' })

