-- Set leader key (recommended to set before plugins)
-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load configurations
require "options"
require "plugins"
require "keys"
require "backup"
require "cmpConf"
require('jake').setup()

-- Delay notifyConf until plugins are loaded
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require "notifyConf"
    end,
})
