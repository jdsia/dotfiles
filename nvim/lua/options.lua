require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- set to transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})

