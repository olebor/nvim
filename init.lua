-- vim.cmd('set rtp+=~/.config/nvcode')

require("config.defaults")
require("bootstrap"):init()

require("plugin-loader"):init()
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

-- Theme Stuff
-- " source $HOME/.config/nvim/themes/gruvbox.vim
-- vim.cmd('source $HOME/.config/nvim/themes/monokai_pro.vim')
-- vim.cmd("source $HOME/.config/nvim/themes/molokai.vim")
-- vim.cmd("source $HOME/.config/nvim/themes/dracula.vim")

-- " General Stuff
-- vim.cmd('source $HOME/.config/nvim/keys/which-key.vim')
vim.cmd("source ~/.config/nvim/vimscript/functions.vim")

require("nv-symbols-outline")

-- " File Management
vim.cmd("source $HOME/.config/nvim/plug-config/vim-rooter.vim")

require("nv-telescope")

--  " Misc
require("nv-quickscope")

-- LSP
require("nv.lsp")
