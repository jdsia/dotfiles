require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- absolute numbers visible in insert/command mode. relative nums in normal mode
vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })



-- set to transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})


-- animated cursor with smear
require("smear_cursor").toggle()

-- Neoscroll settings
require('neoscroll').setup({
  mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
    '<C-u>', '<C-d>',
    '<C-b>', '<C-f>',
    '<C-y>', '<C-e>',
    'zt', 'zz', 'zb',
  },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  duration_multiplier = 0.7,   -- Global duration multiplier
  easing = 'linear',           -- Default easing function
  pre_hook = nil,              -- Function to run before the scrolling animation starts
  post_hook = nil,             -- Function to run after the scrolling animation ends
  performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  ignored_events = {           -- Events ignored while scrolling
      'WinScrolled', 'CursorMoved'
  },
})


