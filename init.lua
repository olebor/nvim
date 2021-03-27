-- vim.cmd('set rtp+=~/.config/nvcode')
if vim.g.vscode then
	-- VS Code extension
	vim.cmd('source $HOME/.config/nvim/vimscript/vscode/init.vim')
	--"source $HOME/.config/nvim/vscode/settings.vim
	--"source $HOME/.config/nvim/plug-config/easymotion.vim
	--"source $HOME/.config/nvim/plug-config/highlightyank.vim
else
	vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
	vim.cmd('source $HOME/.config/nvim/plug-config/polyglot.vim')

	-- General
	vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
	vim.cmd('source $HOME/.config/nvim/general/settings.vim')
	require('nv-globals')
	require('keymappings')
	require('nv-compe')

	-- Theme Stuff
	--" source $HOME/.config/nvim/themes/dracula.vim
	--" source $HOME/.config/nvim/themes/gruvbox.vim
	--" source $HOME/.config/nvim/themes/monokai_pro.vim
	vim.cmd('source $HOME/.config/nvim/themes/molokai.vim')

	-- " General Stuff
	vim.cmd('source $HOME/.config/nvim/keys/which-key.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/start-screen.vim')
	require('nv-bufferline')

	-- LSP
	require('lsp')
	-- require('lsp.clangd')
	require('lsp.lua-ls')
	-- require('lsp.bash-ls')
	require('lsp.js-ts-ls')
	-- require('lsp.python-ls')
	-- require('lsp.json-ls')
	-- require('lsp.yaml-ls')
	-- require('lsp.vim-ls')
	-- require('lsp.graphql-ls')
	-- require('lsp.css-ls')
	-- require('lsp.docker-ls')
	-- require('lsp.html-ls')
	require('lsp.efm-general-ls')
	-- require('lsp.virtual_text')

	-- " Language Tools
	-- vim.cmd('source $HOME/.config/nvim/plug-config/coc/coc.vim')
	-- vim.cmd('source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/terraform.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/nerdcommenter.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/rainbow.vim')

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

	-- " TODO: Sjekk hva som er bra med denne
	vim.cmd('source $HOME/.config/nvim/plug-config/floaterm.vim')
end
