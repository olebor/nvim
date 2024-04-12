-- vim.cmd('set rtp+=~/.config/nvcode')

require("nv.keymappings")

-- Plugin Loader
require("plugin-manager")

local Log = require("core.log")
Log:debug("Starting NerdVim")

vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

-- General
require("nv.settings")
-- require("nv.keymappings")
require("nv.autocommands")

vim.cmd("source $HOME/.config/nvim/vimscript/foldconfig.vim")

-- " File Management
vim.cmd("source $HOME/.config/nvim/plug-config/vim-rooter.vim")

-- LSP
require("nv.lsp")
