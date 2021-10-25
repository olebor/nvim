-- vim.cmd('set rtp+=~/.config/nvcode')


require("bootstrap"):init()

local plugins = require "plugins"
require("plugin-loader"):init()
require("plugin-loader"):load { plugins }

local Log = require "core.log"
Log:debug "Starting NerdVim"

vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
vim.cmd('source $HOME/.config/nvim/plug-config/polyglot.vim')

-- General
vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
require('settings')
require('nv-globals')
require('keymappings')
require('nv-compe')

vim.cmd('source $HOME/.config/nvim/vimscript/foldconfig.vim')

-- Theme Stuff
-- " source $HOME/.config/nvim/themes/dracula.vim
-- " source $HOME/.config/nvim/themes/gruvbox.vim
-- vim.cmd('source $HOME/.config/nvim/themes/monokai_pro.vim')
vim.cmd('source $HOME/.config/nvim/themes/molokai.vim')
require('nv-colorizer')

-- " General Stuff
vim.cmd('source $HOME/.config/nvim/keys/which-key.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
require('nv-bufferline')
require('nv-galaxyline')

-- LSP
require('lsp')
require('lsp.bash-ls')
require('lsp.css-ls')
require('lsp.go-ls')
require('lsp.lua-ls')
require('lsp.js-ts-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.vim-ls')
require('lsp.graphql-ls')
require('lsp.docker-ls')
require('lsp.html-ls')
require('lsp.terraform-ls')
require('lsp.efm-general-ls')

require('nv-symbols-outline')

-- " Language Tools
vim.cmd('source $HOME/.config/nvim/plug-config/terraform.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/nerdcommenter.vim')

-- " File Management
require('core/gitsigns')
vim.cmd('source $HOME/.config/nvim/plug-config/vim-rooter.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/ctrlsf.vim')
-- require('core.nvimtree')
require('nv-telescope')
require('nv-treesitter')

--  " Misc
vim.cmd('source $HOME/.config/nvim/plug-config/terminal.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/blamer.vim')
require('nv-quickscope')
require('nv-hop').config()
require('nv-vsnip')

-- " TODO: Sjekk hva som er bra med denne
vim.cmd('source $HOME/.config/nvim/plug-config/floaterm.vim')
