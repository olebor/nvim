-- vim.cmd('set rtp+=~/.config/nvcode')

require("user.keymappings")

-- Plugin Loader
require("user.lazy")

vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

-- General
require("user.settings")
-- require("nv.keymappings")
require("user.autocommands")

vim.cmd("source $HOME/.config/nvim/vimscript/foldconfig.vim")

-- LSP
require("nv.lsp")
