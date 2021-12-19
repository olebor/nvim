-- vim.cmd('set rtp+=~/.config/nvcode')

require('config.defaults')
require("bootstrap"):init()

local plugins = require "plugins"
require("plugin-loader"):init()
require("plugin-loader"):load { plugins }

local Log = require "core.log"
Log:debug "Starting NerdVim"

vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')

-- General
vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
require('settings')
require('nv-globals')
require('keymappings')
-- require('nv-compe')

vim.cmd('source $HOME/.config/nvim/vimscript/foldconfig.vim')

-- Theme Stuff
-- " source $HOME/.config/nvim/themes/dracula.vim
-- " source $HOME/.config/nvim/themes/gruvbox.vim
-- vim.cmd('source $HOME/.config/nvim/themes/monokai_pro.vim')
vim.cmd('source $HOME/.config/nvim/themes/molokai.vim')

-- " General Stuff
vim.cmd('source $HOME/.config/nvim/keys/which-key.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
-- require('nv-bufferline')
require('nv-galaxyline')

require('nv-symbols-outline')

-- " Language Tools
vim.cmd('source $HOME/.config/nvim/plug-config/terraform.vim')

-- " File Management
require('core/gitsigns')
vim.cmd('source $HOME/.config/nvim/plug-config/vim-rooter.vim')

-- require('core.nvimtree')
require('nv-telescope')

--  " Misc
vim.cmd('source $HOME/.config/nvim/plug-config/terminal.vim')
require('nv-quickscope')

-- " TODO: Sjekk hva som er bra med denne
vim.cmd('source $HOME/.config/nvim/plug-config/floaterm.vim')

-- LSP
require('lsp')
