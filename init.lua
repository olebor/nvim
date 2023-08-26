-- vim.cmd('set rtp+=~/.config/nvcode')

-- Plugin Loader
require("lazy-nvim")

local Log = require("core.log")
Log:debug("Starting NerdVim")

vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

-- General
require("nv.settings")
require("nv.keymappings")
require("nv.autocommands")
-- require('nv-compe')

vim.cmd("source $HOME/.config/nvim/vimscript/foldconfig.vim")

-- " General Stuff
vim.cmd("source ~/.config/nvim/vimscript/functions.vim")

require("nv-symbols-outline")

-- " File Management
vim.cmd("source $HOME/.config/nvim/plug-config/vim-rooter.vim")

require("nv-telescope")

-- LSP
require("nv.lsp")
