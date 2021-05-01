-- vim.cmd('set rtp+=~/.config/nvcode')
vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
vim.cmd('source $HOME/.config/nvim/plug-config/polyglot.vim')

-- General
vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
require('settings')
require('nv-globals')
require('keymappings')
require('nv-compe')

-- Theme Stuff
-- " source $HOME/.config/nvim/themes/dracula.vim
-- " source $HOME/.config/nvim/themes/gruvbox.vim
-- " source $HOME/.config/nvim/themes/monokai_pro.vim
vim.cmd('source $HOME/.config/nvim/themes/molokai.vim')
require('nv-colorizer')

-- " General Stuff
vim.cmd('source $HOME/.config/nvim/keys/which-key.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/start-screen.vim')
require('nv-bufferline')
require('nv-galaxyline')
-- require('nv-gitsigns')

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

-- " Language Tools
-- vim.cmd('source $HOME/.config/nvim/plug-config/coc/coc.vim')
-- vim.cmd('source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/terraform.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/nerdcommenter.vim')
-- vim.cmd('source $HOME/.config/nvim/plug-config/rainbow.vim')

-- " File Management
-- vim.cmd('source $HOME/.config/nvim/plug-config/fzf.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/gitgutter.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/vim-rooter.vim')
require('nv-nvimtree')
require('nv-telescope')
require('nv-treesitter')

--  " Misc
vim.cmd('source $HOME/.config/nvim/plug-config/terminal.vim')
vim.cmd('source $HOME/.config/nvim/plug-config/blamer.vim')
require('nv-quickscope')

-- " TODO: Sjekk hva som er bra med denne
vim.cmd('source $HOME/.config/nvim/plug-config/floaterm.vim')
