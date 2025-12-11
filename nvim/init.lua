vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)


-- telescope options to override
-- telescope settings
--require('telescope').setup({ pickers = { find_files = { layout_config = { prompt_position = 'top', }, sorting_strategy = 'ascending', }, }, })
--require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))
--require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ winblend = 10 }))

require('telescope').setup{
  defaults = {
    -- ...
  },
  pickers = {
    find_files = {
      theme = "ivy",
      winblend = 0,
    },
    lsp_document_symbols = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    }
  },
  extensions = {
    fzf = {}
  }
}

require('telescope').load_extension('fzf')

-- sets telescope normal background to transpparent
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })



-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)


