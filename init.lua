-- vim.cmd('set rtp+=~/.config/nvcode')

require("user.keymappings")

-- Plugin Loader
require("user.lazy")

-- General
require("user.settings")
-- require("nv.keymappings")
require("user.autocommands")

-- LSP
require("nv.lsp")
